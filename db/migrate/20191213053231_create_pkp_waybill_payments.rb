class CreatePkpWaybillPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_payments do |t|
    	t.integer :waybill_payment_id	#支付流水号
    	t.integer :pkp_waybill_id	#运单流水号
    	t.string :waybill_no	#运单号
    	t.string :payment_type	#支付方式 1：现金 2：微信 3：支付宝 4：POS机 5：优惠券 6：闪付 7：预付卡 
    	t.float :payment_amount	#支付金额
    	t.float :union_payment_amount	#合并支付总金额
    	t.string :tran_id	#交易流水号
    	t.string :payment_account	#支付账号
    	t.datetime :payment_date	#支付时间
    	t.string :payment_state	#支付状态 0：未支付 1：已支付
    	t.string :payment_link	#支付环节
    	t.string :for_the_account	#入账账号
    	t.datetime :biz_occur_date	#业务发生时间（分表），预告信息接入代表接入时间，PDA揽收代表揽收时间，收寄作业代表收寄时间，运单调整代表申请调整时间。
    	t.integer :post_org_id	#收寄机构编号
    	t.string :post_org_no	#收寄机构代码
    	t.string :org_drds_code	#分库机构代码（分库）
    	t.string :post_org_name	#收寄机构名称
    	t.string :is_deleted	#是否删除：0：否 1：是
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
