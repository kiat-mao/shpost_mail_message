class AddDateToPkpWaybillDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :pkp_waybill_deliveries, :handled_at, :datetime
    add_column :pkp_waybill_deliveries, :delivered_at, :datetime
  end
end
