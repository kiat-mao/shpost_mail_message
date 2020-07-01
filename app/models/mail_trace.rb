class MailTrace < ApplicationRecord
  has_many :mail_trace_details
  # validates_presence_of :mail_no, :message => '不能为空'
  # validates_uniqueness_of :mail_no, :message => '该挂号编号已存在'

  STATUS = { own: 'own', other: 'other', unit: 'unit', returns: 'returns', waiting: 'waiting'}

  STATUS_SHOW = { own: '本人收', other: '他人收', unit: '单位收', returns: '退件', waiting: '未妥投'}

  STATUS_DELIVERED = [STATUS[:own], STATUS[:other], STATUS[:unit]]

  def self.save_mail_trace(msg_hash, received_at)
    ActiveRecord::Base.transaction do
      traces = msg_hash['traces']

      mail_no = traces.first['traceNo']
      
      begin
        mail_trace = find_by(mail_no: mail_no)

        if !mail_trace.blank?
          if mail_trace.last_received_at > received_at #In SQLITE3 May be not,cuz it will save datetime with del last precision
            return mail_trace
          else
            to_update = false
            
            last_result = get_result_with_status(traces)
            if mail_trace.status.eql? STATUS[:waiting]
              to_update = true if last_result["opt_at"].to_time >= mail_trace.operated_at
            elsif mail_trace.status.eql? STATUS[:returns]
              to_update = false
            else
              to_update = true if ! last_result["status"].eql? STATUS[:waiting]
            end

            if to_update
              mail_trace.update!(last_trace: traces.last.to_json, status: last_result["status"], result: last_result["opt_desc"], operated_at: last_result["opt_at"], is_posting: last_result["is_posting"], last_received_at: received_at)
            else
              mail_trace.update!(last_received_at: received_at)
            end
            mail_trace.mail_trace_details.create!(traces: traces.to_json)
          end
        else
          last_result = get_result_with_status(traces)

          mail_trace = MailTrace.create!(mail_no: mail_no, last_trace: traces.last.to_json, status: last_result["status"], result: last_result["opt_desc"], operated_at: last_result["opt_at"], is_posting: last_result["is_posting"], last_received_at: received_at)
          

          mail_trace.mail_trace_details.create!(traces: traces.to_json)
        end
      rescue ActiveRecord::RecordNotUnique => e
        Rails.logger.error("create mail_trace unique_error: #{msg_hash}")
        Rails.logger.error("#{e.class.name} #{e.message}")
        retry
      end 
    end
  end


  def self.get_result_with_status(response)
    last_result = response.last

    opt_code = last_result["opCode"]
    opt_desc = last_result["opDesc"]
    opt_time = last_result["opTime"]
    
    status = MailTrace::STATUS[:waiting]

    if !opt_code.blank?
      if opt_code.eql? '704'
        if opt_desc.include? '本人'
          status = MailTrace::STATUS[:own]
        elsif opt_desc.include? '他人'
          status = MailTrace::STATUS[:other]
        else
          status = MailTrace::STATUS[:unit]
        end
      elsif opt_code.eql? '748'
        status = MailTrace::STATUS[:own]
      elsif opt_code.eql? '747'
        status = MailTrace::STATUS[:unit]
      elsif !response.reject{|x| !x["opCode"].in? ["708", '711']}.blank?
        status = MailTrace::STATUS[:returns]
      end
    end
    result = {"opt_at" => opt_time, "opt_desc" => opt_desc, "status" => status}

    if status.eql? MailTrace::STATUS[:waiting]
      result["is_posting"] = response.find{|x| x['opCode'].eql? '203' }.blank? ? false : true
    else
      result["is_posting"] = false
    end

    result
  end
end
