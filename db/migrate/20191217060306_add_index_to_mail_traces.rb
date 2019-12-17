class AddIndexToMailTraces < ActiveRecord::Migration[5.2]
  def change
    add_index :mail_traces, [:mail_no, :status], unique: true
  end
end
