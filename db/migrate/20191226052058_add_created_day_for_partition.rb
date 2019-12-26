class AddCreatedDayForPartition < ActiveRecord::Migration[5.2]
  def change
    add_column :pkp_waybill_bases, :created_day, :string
    add_column :pkp_waybill_bizs, :created_day, :string
    add_column :pkp_waybill_cargos, :created_day, :string
    add_column :pkp_waybill_packages, :created_day, :string
    add_column :pkp_waybill_fees, :created_day, :string
    add_column :pkp_waybill_bills, :created_day, :string
    add_column :pkp_waybill_scans, :created_day, :string
    add_column :pkp_waybill_mores, :created_day, :string
    add_column :pkp_waybill_payments, :created_day, :string
    add_column :interface_logs, :created_day, :string
    add_column :interface_senders, :created_day, :string
    add_column :mail_traces, :created_day, :string
  end
end
