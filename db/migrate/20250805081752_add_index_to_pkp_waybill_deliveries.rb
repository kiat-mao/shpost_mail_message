class AddIndexToPkpWaybillDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_index :pkp_waybill_deliveries, :waybill_no
    add_index :pkp_waybill_deliveries, :delivered_at
  end
end
