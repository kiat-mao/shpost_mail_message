class AddIndexToInterfaceSenders < ActiveRecord::Migration[5.2]
  def change
    add_index :interface_senders, [:parent_id, :created_at, :status], unique: true
    # add_index :interface_senders, [:business_id], name: :index_interface_senders_on_business_id
    # add_index :interface_senders, [:unit_id], name: :index_interface_senders_on_unit_id
  end
end
