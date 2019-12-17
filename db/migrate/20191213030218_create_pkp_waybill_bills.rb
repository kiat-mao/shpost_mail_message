class CreatePkpWaybillBills < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_bills do |t|
    	t.integer :waybill_bill_id	#收寄运单结算信息流水号
    	t.integer :pkp_waybill_id	#运单流水号
    	t.string :waybill_no	#运单号
    	t.datetime :biz_occur_date	#业务发生时间（分表），预告信息接入代表接入时间，PDA揽收代表揽收时间，收寄作业代表收寄时间，运单调整代表申请调整时间。
    	t.integer :post_org_id	#收寄机构编号
    	t.string :post_org_no	#收寄机构代码
    	t.string :org_drds_code	#分库机构代码（分库）
    	t.string :post_org_name	#收寄机构名称
    	t.datetime :c_favourable_effect_time	#客户优惠生效开始时间
    	t.string :customer_preferential_type	#客户优惠类型 1:事前 2:事后 3:累进
    	t.string :customers_preferential_id	#客户优惠规则ID
    	t.float :standard_rates_start	#标资起资
    	t.float :standard_rates_continue	#标资续资
    	t.integer :p_cumulative_startnum	#事后优惠累计开始数
    	t.integer :preferential_cumulative_endnum	#事后优惠累计结束数
    	t.integer :preferential_cumulative_num	#累计优惠本单累计数
    	t.string  :is_deleted	#是否删除：0：否 1：是
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
