class MailTrace < ApplicationRecord
  validates_presence_of :mail_no, :message => '不能为空'
  validates_uniqueness_of :mail_no, :message => '该挂号编号已存在'

  STATUS = { own: 'own', other: 'other', unit: 'unit', returns: 'returns', waiting: 'waiting'}

  STATUS_SHOW = { own: '本人收', other: '他人收', unit: '单位收', returns: '退件', waiting: '未妥投'}

  def self.save_mail_trace(msg_hash, received_at)
    traces = msg_hash['traces']

    mail_no = traces.first['traceNo']
    
    mail_trace = find_by(mail_no: mail_no)

    if !mail_trace.blank?
      if mail_trace.last_received_at >= received_at #In SQLITE3 May be not,cuz it will save datetime with del last precision
        return mail
      else
        last_result = get_result_with_status(traces)

        mail_trace.update!(status: last_result["status"], result: last_result["opt_desc"], operated_at: last_result["opt_at"], is_posting: last_result["is_posting"], traces: msg_hash.to_json, last_received_at: received_at)
      end
    else
      last_result = get_result_with_status(traces)

      create!(mail_no: mail_no, status: last_result["status"], result: last_result["opt_desc"], operated_at: last_result["opt_at"], is_posting: last_result["is_posting"], traces: msg_hash.to_json, last_received_at: received_at)
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
