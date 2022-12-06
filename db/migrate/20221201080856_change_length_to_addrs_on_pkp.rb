class ChangeLengthToAddrCargoOnPkp < ActiveRecord::Migration[6.0]
  def change
    change_column :pkp_waybill_bases, :receiver_addr, :string, length: 500
    change_column :pkp_waybill_bases, :sender_addr, :string, length: 500
  end
end
