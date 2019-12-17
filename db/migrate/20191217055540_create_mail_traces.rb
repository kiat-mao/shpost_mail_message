class CreateMailTraces < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_traces do |t|
      t.string   :mail_no
      t.string   :result
      t.string   :status
      t.text     :traces
      t.boolean  :is_posting
      t.datetime :operated_at
      t.datetime :last_received_at

      t.timestamps
    end
  end
end
