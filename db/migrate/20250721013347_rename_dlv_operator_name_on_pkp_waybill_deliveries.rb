class RenameDlvOperatorNameOnPkpWaybillDeliveries < ActiveRecord::Migration[6.0]
  def change
    rename_column :pkp_waybill_deliveries, :dlv_operatorName, :dlv_operator_name
  end
end
