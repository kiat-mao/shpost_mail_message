class StandardInterfaceController < ApplicationController
  around_action :interface_return
  skip_before_action :verify_authenticity_token

  private
  def out_error e
    puts e.message
    puts e.backtrace 
    Rails.logger.error("#{e.class.name} #{e.message}")
    e.backtrace.each{|x| Rails.logger.error(x)}
  end

  def verify_params
    @format = params[:format]
    return error_builder('0002') if !@format.eql? 'JSON'

    @unit = Unit.find_by(no: params[:unit])
    return error_builder('0003') if @unit.nil?

    @business = Business.find_by(no: params[:business], unit: @unit)
    return error_builder('0004') if @business.nil?

    @context = params[:context]
    begin
      @context_hash = ActiveSupport::JSON.decode(@context)
    rescue Exception => e
      return error_builder('0002')
    end

    @mark = params[:mark]
    
    return verify_sign

  end

  def verify_sign
    @sign = params[:sign]
    secrect_key = @business.secret_key1 ||= @business.secret_key
    return error_builder('0001') if !@sign.eql? Digest::MD5.hexdigest("#{@context}#{secrect_key}")
  end

  def interface_return
    begin
      verify_params
      if !@status.eql? false
        yield
      end
    ensure
      InterfaceLog.log(params[:controller], params[:action], @unit, @business, @status, request.url, params.to_json, @return_json.to_json, request.ip, @business_code, @object) unless params[:action].eql?('mail_query')
    end
  end

  def success_builder(info = nil)
    @status = true
    success = {'FLAG' => 'success'}
    if info.nil?
      @return_json = success
    else
      @return_json = success.merge info
    end
    render json: @return_json
  end

  def error_builder(code, msg = nil)
    @status = false
    @return_json = {'FLAG' => 'failure', 'CODE' => code, 'MSG' => msg.nil? ? I18n.t("standard_interface.error.#{code}") : I18n.t("standard_interface.error.#{code}") + ':' + msg }.to_json
    # @return_json
    Rails.logger.error("#{code} #{msg}")

    render json: @return_json
  end

  def render_json
    render json: @return_json
  end
end
