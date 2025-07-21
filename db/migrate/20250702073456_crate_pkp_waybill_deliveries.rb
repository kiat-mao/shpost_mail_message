class CratePkpWaybillDeliveries < ActiveRecord::Migration[6.0]
  def change
    # remove_table :pkp_waybill_deliveries
    create_table :pkp_waybill_deliveries do |t|
      t.string :waybill_no #运单号
      t.string :post_org_no	#收寄机构代码
      t.string :post_org_name	#收寄机构名称

      t.string :sender	#寄件客户名称
      t.string :sender_linker	#寄件联系人
      t.string :sender_mobile	#寄件客户手机
      t.string :sender_id_no	#寄件人证件号码
      t.string :sender_addr	#寄件客户地址

      t.string :receiver_linker	#收件联系人
      t.string :receiver_mobile	#收件客户手机
      t.string :receiver_addr	#收件客户地址
      t.string :receiver_addr_additional #收件客户附加地址

      t.decimal :fee_weight, :precision => 8, :scale => 0
      t.decimal :postage_paid, :precision => 12, :scale =>  2#实收邮资

      t.string :receiver_gis	#收件GIS坐标

      t.string :dlv_org_no  #投递机构代码
      t.string :dlv_org_name  #投递机构名称
      t.string :dlv_operatorName #投递员姓名

      t.string :status, default: 'waiting' #状态 waiting, own, other, unit, returns
      t.timestamps 
    end
  end
end
