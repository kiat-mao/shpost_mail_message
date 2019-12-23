class AddRequestUrlToInterfaceLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :interface_logs, :request_url, :string
  end
end
