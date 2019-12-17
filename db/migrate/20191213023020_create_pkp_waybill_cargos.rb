class CreatePkpWaybillCargos < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_cargos do |t|
    	t.integer :waybill_cargo_id	#运单商品流水号
    	t.integer :pkp_waybill_id	#运单流水号
    	t.string :waybill_no	#运单号
    	t.string :cargo_serial	#商品序号
    	t.string :cargo_type_no	#商品类型代码 1：内件单证 2：报关物品 3：礼仪商品
    	t.string :cargo_type_name	#商品类型名称
    	t.string :cargo_category_id	#商品归类编码
    	t.string :cargo_category_name	#商品归类名称
    	t.string :cargo_no	#商品编号
    	t.string :cargo_name	#商品名称
    	t.string :cargo_name_en	#商品名称（英文）
    	t.string :cargo_origin_no	#商品原产地代码
    	t.string :cargo_origin_name	#商品原产地名称
    	t.string :cargo_barcode	#商品条码
    	t.string :cargo_measure_unit	#商品计量单位
    	t.string :status	#状态
    	t.float :volume	#体积
    	t.float :weight	#重量
    	t.integer :quantity	#数量
    	t.string :packaging	#货物包装
    	t.string :package_status	#包装状况
    	t.string :move_notes	#装运要求
    	t.float :cargo_value	#商品价值
    	t.float :cargo_price	#商品售价
    	t.float :cargo_purchasing_price	#商品进价
    	t.float :cargo_total_price	#商品总售价
    	t.float :cargo_total_purchasing_price	#商品总进价
    	t.string :notes	#备注
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
