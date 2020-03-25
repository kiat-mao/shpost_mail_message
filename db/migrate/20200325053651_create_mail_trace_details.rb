class CreateMailTraceDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_trace_details do |t|
      t.references :mail_trace#, foreign_key: true
      t.string :traces, limit: 4000
      t.string :created_day
      t.timestamps
    end
  end
end
