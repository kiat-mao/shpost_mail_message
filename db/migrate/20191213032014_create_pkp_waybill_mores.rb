class CreatePkpWaybillMores < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_mores do |t|
    	t.integer :waybill_more_id	#一票多件批次号
    	t.integer :pkp_waybill_id	#运单流水号
    	t.integer :sub_waybill_id	#子单流水号
    	t.string :waybill_no
    	t.string :main_waybill_no	#主单号
    	t.string :sub_waybill_no	#子单号
    	t.float :one_bill_total_weight	#一票多件总重量
    	t.integer :one_bill_total_number	#一票多件总件数
    	t.string :one_bill_flag	#一票多件标志 0:正常   1:主单   2:子单
    	t.string :spilt_delivery_flag	#是否拆单投递标志：0 不拆单  1可以拆单
    	t.float :real_weight	#实际重量
    	t.float :volume_weight	#体积重量
    	t.float :fee_weight	#计费重量
    	t.float :volume	#体积
    	t.float :length	#长
    	t.float :width	#宽
    	t.float :height	#高
    	t.integer :serial_no	#排序号
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
