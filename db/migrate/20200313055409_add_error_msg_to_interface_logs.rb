class AddErrorMsgToInterfaceLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :interface_logs, :error_msg, :text
  end
end
