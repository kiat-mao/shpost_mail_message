class AddIndexToPkpWaybillBases < ActiveRecord::Migration[5.2]
  def change
    add_index :pkp_waybill_bases, :sender_no
  end
end