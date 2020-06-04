ApplicationConsumer = Class.new(Karafka::BaseConsumer)

class TopicConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      puts "Message payload: #{message.payload}"
      # message.payload
      # MailTrace.create!(mail_no: Time.now.to_f)
      puts metadata
    end
  end
end