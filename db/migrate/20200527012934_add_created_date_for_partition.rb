class AddCreatedDateForPartition < ActiveRecord::Migration[6.0]
  def change
  	add_column :pkp_waybill_bases, :created_date, :string
    add_column :pkp_waybill_bizs, :created_date, :string
    add_column :pkp_waybill_cargos, :created_date, :string
    add_column :pkp_waybill_packages, :created_date, :string
    add_column :pkp_waybill_fees, :created_date, :string
    add_column :pkp_waybill_bills, :created_date, :string
    add_column :pkp_waybill_scans, :created_date, :string
    add_column :pkp_waybill_mores, :created_date, :string
    add_column :pkp_waybill_payments, :created_date, :string
    add_column :mail_traces, :created_date, :string
    add_column :mail_trace_details, :created_date, :string
  end
end
