class ChangeLenghtToResultOnMailTraces < ActiveRecord::Migration[6.0]
  def change
  	change_column :mail_traces, :result, :string, length: 500
  end
end
