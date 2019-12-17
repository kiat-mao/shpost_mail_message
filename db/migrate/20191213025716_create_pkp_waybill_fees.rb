class CreatePkpWaybillFees < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_fees do |t|
    	t.integer :waybill_fee_id	#运单费用流水号
    	t.integer :pkp_waybill_id	#运单流水号
    	t.string :waybill_no	#运单号
    	t.string :item_no	#费用编号
    	t.string :item_name	#费用名称
    	t.float :item_amount	#费用金额
    	t.string :payment_mode	#付款方式(付款方)  1:寄件人 2:收件人 3:第三方 4:收件人集中付费 5:免费 6:寄/收件人 7:预付卡 
    	t.datetime :biz_occur_date	#业务发生时间（分表），预告信息接入代表接入时间，PDA揽收代表揽收时间，收寄作业代表收寄时间，运单调整代表申请调整时间。
    	t.integer :post_org_id	#收寄机构编号
    	t.string :post_org_no	#收寄机构代码
    	t.string :org_drds_code	#分库机构代码（分库）
    	t.string :post_org_name	#收寄机构名称
    	t.string :is_deleted	#是否删除：0：否1：是
    	t.integer :create_user_id	#创建人id
    	t.datetime :gmt_created	#创建时间
    	t.integer :modify_user_id	#修改人id
    	t.datetime :gmt_modified	#修改时间
    	t.integer :reserved1	#预留字段1
    	t.integer :reserved2	#预留字段2
    	t.integer :reserved3	#预留字段3
    	t.string :reserved4	#预留字段4
    	t.string :reserved5	#预留字段5
    	t.string :reserved6	#预留字段6
    	t.string :reserved7	#预留字段7
    	t.string :reserved8	#预留字段8
    	t.datetime :reserved9	#预留字段9
    	t.text :reserved10	#预留字段10

        t.timestamps
    end
  end
end
