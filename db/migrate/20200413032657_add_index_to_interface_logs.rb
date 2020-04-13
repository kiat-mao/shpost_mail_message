class AddIndexToInterfaceLogs < ActiveRecord::Migration[5.2]
  def change
    add_index :interface_logs, :business_code
  end
end
