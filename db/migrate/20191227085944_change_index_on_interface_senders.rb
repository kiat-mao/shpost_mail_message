class ChangeIndexOnInterfaceSenders < ActiveRecord::Migration[5.2]
  def change
    remove_index :interface_senders, [:parent_id, :created_at, :status]
    add_index :interface_senders, :parent_id
    add_index :interface_senders, :created_at
    add_index :interface_senders, :status
  end
end
