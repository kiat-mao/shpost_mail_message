class MailTraceController < ApplicationController
  around_action :interface_around
  skip_before_action :verify_authenticity_token

  def mail_trace
    return error_builder('0009') if (@msg_hash.blank? || @msg_hash['traces'].blank?)
    trace = @msg_hash['traces'].first
    return error_builder('0009') if (trace.blank? || trace['traceNo'].blank?)
  
    @business_code = trace['traceNo']

    begin
      mail = MailTrace.save_mail_trace(@msg_hash, @send_date)
    rescue Exception => e
      if ! e.is_a? RuntimeError
        out_error e
      end
      return error_builder('9999')
    end

    if ! mail.blank?
      @object = mail
      return success_builder
    else
      return error_builder('9999')
    end
  end

  private
  def interface_around
    begin
      verify_params
      if ! @status.eql? false
        yield
      end
    ensure
      InterfaceInfo.log(params[:controller], params[:action], @status,{url: request.url, params: params.to_json, response: @response, ip: request.ip, business_code: @business_code, parent: @object}) if Rails.env.development?
    end
  end

  def verify_params
    @send_id = params[:sendID]
    return error_builder('0001') if ! @send_id.try(:eql?, 'JDPT')

    @msg_kind = params[:msgKind]
    return error_builder('0002') if ! @msg_kind.try(:eql?, 'JDPT_SHPOST_MAIL_TRACE')

    @serial_no = params[:serialNo]
    return error_builder('0003') if @serial_no.blank?

    @send_date = params[:sendDate].try(:to_time)
    return error_builder('0004') if @send_date.blank?

    @receive_id = params[:receiveID]
    return error_builder('0005') if ! @receive_id.try(:eql?, 'SHPOST_MAIL')

    @data_type = params[:dataType]
    return error_builder('0006') if ! @data_type.try(:eql?, '1')


    @msg_body = params[:msgBody]

    begin
      @msg_json = URI.decode(@msg_body)
      @msg_hash = ActiveSupport::JSON.decode(@msg_json)
    rescue Exception => e
      return error_builder('0007')
    end

    return verify_sign
  end

  def verify_sign
    @date_digest = params[:dataDigest]
    return error_builder('0008') if ! @sign.eql? data_digest(@msg_json, I18n.t('mail_trace_interface.secret_key'))
  end

  def data_digest(context, secret_key)
    Base64.encode64(Digest::MD5.hexdigest("#{context}#{secret_key}")).strip
  end

  def success_builder
    @status = true

    @response = response_builder

    render json: @response
  end

  def error_builder(error_code)
    @status = false

    @reson = I18n.t("mail_trace_interface.error.#{error_code}")

    @response = response_builder

    render json: @response
  end

  def response_builder(reson = nil)
    return {'receiveID' => @receive_id, 'responseState' => @status, 'responseItems' => [{'trace' => @mail_no, 'success' => @status, 'reson' => @reson}]}.to_json
  end

  def out_error e
    # puts e.message
    # puts e.backtrace 
    Rails.logger.error("#{e.class.name} #{e.message}")
    e.backtrace.each{|x| Rails.logger.error(x)}
  end
end
