class CreatePkpWaybillBizs < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_bizs do |t|
    	t.integer :waybill_biz_id
    	t.integer :pkp_waybill_id	#运单流水号
    	t.integer :order_id	#订单号（平台内唯一）
    	t.integer :base_product_id	#基础产品编号
    	t.string :base_product_no	#基础产品代码
    	t.string :base_product_name	#基础产品名称
    	t.integer :biz_product_id	#业务产品编号
    	t.string :biz_product_no	#业务产品代码
    	t.string :biz_product_name	#业务产品名称
    	t.string :io_type	#收寄来源：10：录入收寄  20：导入收寄 30：PDA收寄 40：终端收寄
    	t.string :waybill_no	#运单号
    	t.datetime :biz_occur_date	#业务发生时间（分表），预告信息接入代表接入时间，PDA揽收代表揽收时间，收寄作业代表收寄时间，运单调整代表申请调整时间。
    	t.integer :post_org_id	#收寄机构编号
    	t.string :post_org_no	#收寄机构代码
    	t.string :org_drds_code	#分库机构代码（分库）
    	t.string :post_org_name	#收寄机构名称
    	t.integer :post_person_id	#收寄人员编号
    	t.string :post_person_no	#收寄人员代码
    	t.string :post_person_name	#收寄人员名称
    	t.string :post_person_mobile	#收寄人员手机
    	t.integer :pickup_person_id	#揽收人员编号
    	t.string :pickup_person_no	#揽收人员代码
    	t.string :pickup_person_name	#揽收人员名称
    	t.string :pickup_person_mobile	#揽收人员手机
    	t.integer :teamwk_pickup_person_id	#协同揽收人员编号
    	t.string :teamwk_pickup_person_no	#协同揽收人员代码
    	t.string :teamwk_pickup_person_name	#协同揽收人员名称
    	t.string :teamwk_pickup_person_mobile	#协同揽收人员手机
    	t.datetime :pickup_date	#揽收时间
    	t.datetime :shuttle_bus_date	#趟车时间
    	t.string :sender_type	#0 散户 1协议客户
    	t.integer :sender_id	#寄件客户编号
    	t.string :sender_no	#寄件客户代码（大宗客户代码）
    	t.string :sender	#寄件客户名称
    	t.integer :sender_warehouse_id	#寄件客户分仓编号
    	t.string :sender_warehouse_name	#寄件客户分仓名称
    	t.string :sender_linker	#寄件联系人
    	t.string :sender_fixtel	#寄件客户电话
    	t.string :sender_mobile	#寄件客户手机
    	t.string :sender_im_type	#寄件即时通讯类型
    	t.string :sender_im_id	#寄件客户即时通讯ID
    	t.string :sender_addr	#寄件客户地址
    	t.string :sender_addr_additional	#寄件客户附加地址
    	t.string :sender_district_no	#寄件行政区划
        t.string :sender_postcode	#寄件邮编
    	t.string :sender_notes	#寄件备注
    	t.decimal :real_weight	, :precision => 8, :scale => 0 #实际重量
    	t.string :post_state	#10 已收寄 20 已出库 30 已封总包 40 已趟车
    	t.string :post_notes	#邮件备注
    	t.string :allow_sealing_flag	#是否可封发标志 0 不可封发， 1可封发
    	t.datetime :expect_sealing_date	#预计封发日期
    	t.string :allow_deliver_flag	#是否可投递标志  0 不可投递， 1可投递
    	t.string :need_reapply_type_flag	#是否需补录标志： 0 不需补录， 1 需补录
    	t.string :reapply_type_fulfil_flag	#是否补录完成标志：0 未补录 1 已补录
    	t.string :post_batch_id	#收寄批次号
    	t.string :one_bill_flag	#一票多件标志 0:正常   1:主单   2:子单
    	t.string :one_bill_main_waybill_no	#主运单号：运单号：主运单号
    	t.string :one_bill_fee_type	#1：主单统一计费  2：平均重量计费  3：分单免首重计费  4：主分单单独计费
    	t.string :distributive_center_no	#集散中心代码
        t.string :distributive_center_name	#集散中心名称
    	t.string :p_export_center_org_no	#省际出口中心局代码
    	t.string :p_export_center_org_name	#省际出口中心局名称
    	t.string :export_center_org_no	#出口中心局代码
    	t.string :export_center_org_name	#出口中心局名称
    	t.string :p_import_central_org_no	#省际进口中心局代码
    	t.string :p_import_central_org_name	#省际进口中心局名称
        t.string :import_central_org_no	#进口中心局代码
    	t.string :import_central_org_name	#进口中心局名称
    	t.string :receiver_country_no	#寄达国代码
    	t.string :receiver_country_name	#寄达国名称
    	t.string :receiver_arrive_org_no	#寄达局代码
    	t.string :receiver_arrive_org_name	#寄达局名称
    	t.string :receiver_seal_arrive_org_no	#集包封发寄达局代码
    	t.string :receiver_seal_arrive_org_name	#集包封发寄达局名称
    	t.string :seal_arrive_org_no	#封发寄达局代码
    	t.string :seal_arrive_org_name	#封发寄达局名称
    	t.string :seal_arrive_area_no	#封发寄达局区域代码
    	t.string :deliver_org_no	#投递局代码
    	t.string :deliver_org_name	#投递局名称
    	t.string :deliver_section	#投递道段
    	t.string :deliver_section_name	#投递道段名称
    	t.string :deliver_take_org_no	#投递自提点代码
    	t.string :deliver_take_org_name	#投递自提点名称
    	t.string :export_customs_no	#出口关区代码
    	t.string :export_customs_name	#出口关区名称
    	t.string :export_interchange_no	#出口互换局代码
        t.string :export_interchange_name	#出口互换局名称
    	t.string :the_org_grid_no	#本机构格口代码
    	t.string :the_org_grid_name	#本机构格口名称
    	t.string :export_grid_no	#出口格口代码
    	t.string :export_grid_name	#出口格口名称
    	t.string :import_grid_no	#进口格口代码
    	t.string :import_grid_name	#进口格口名称
    	t.string :straight_seal_flag	#直封标志
    	t.string :this_turn_flag	#本转标志
    	t.string :single_seal_flag	#单封标志
    	t.string :sorting_code	#分拣码
    	t.string :wms_out_batch_no	#出库批次号
    	t.string :s_handling_transportation	#运输特殊处理  1：易碎品 2：贵品 3：电池
    	t.string :processing_attribute1	#处理属性1
    	t.string :processing_attribute2	#处理属性2
    	t.string :pickup_attribute	#收寄属性 1：全部  2：邮政 3：速递
    	t.string :deliver_attribute	#投递属性 1：全部 2：分网省 3：整合省
    	t.string :workbench	#台席
    	t.string :product_reach_area	#寄达范围 1：同城 2：地市 3：省内 4：国内 5：国际(地区)
    	t.string :contents_attribute	#内件性质 1：文件 2：信函 3：物品 4：包裹
        t.string :is_deleted	#是否删除：0：否1：是
        t.integer :create_user_id	#创建人id
        t.datetime :gmt_created	#创建时间
        t.integer :modify_user_id	#修改人id
        t.datetime :gmt_modified	#修改时间
        t.integer :reserved1	#预留字段1
        t.integer :reserved2	#预留字段2
        t.integer :reserved3   #预留字段3
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
