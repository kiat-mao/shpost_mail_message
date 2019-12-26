class ChangeIndexOnMailTraces < ActiveRecord::Migration[5.2]
  def change
    remove_index :mail_traces, [:mail_no, :status]
    add_index :mail_traces, :mail_no, unique: true
    add_index :mail_traces, :status
  end
end
