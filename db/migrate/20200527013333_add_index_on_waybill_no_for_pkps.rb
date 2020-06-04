class AddIndexOnWaybillNoForPkps < ActiveRecord::Migration[6.0]
  def change
  	add_index :pkp_waybill_bases, :waybill_no
    add_index :pkp_waybill_bizs, :waybill_no
    add_index :pkp_waybill_cargos, :waybill_no
    add_index :pkp_waybill_packages, :waybill_no
    add_index :pkp_waybill_fees, :waybill_no
    add_index :pkp_waybill_bills, :waybill_no
    add_index :pkp_waybill_scans, :waybill_no
    add_index :pkp_waybill_mores, :waybill_no
    add_index :pkp_waybill_payments, :waybill_no
  end
end
