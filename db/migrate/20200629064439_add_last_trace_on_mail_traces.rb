class AddLastTraceOnMailTraces < ActiveRecord::Migration[6.0]
  def change
  	add_column :mail_traces, :last_trace, :string
  end
end
