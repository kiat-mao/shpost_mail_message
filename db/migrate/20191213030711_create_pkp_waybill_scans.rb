class CreatePkpWaybillScans < ActiveRecord::Migration[5.2]
  def change
    create_table :pkp_waybill_scans do |t|
    	t.integer :waybill_scan_id	#运单扫描回传流水号
    	t.string :waybill_no	#运单号
    	t.datetime :repeat_record_date	#补录时间
    	t.integer :repeat_record_person_id	#补录人员编号
    	t.string :repeat_record_person_no	#补录人员代码
    	t.string :repeat_record_person_name	#补录人员名称
    	t.datetime :biz_occur_date	#业务发生时间（分表），预告信息接入代表接入时间，PDA揽收代表揽收时间，收寄作业代表收寄时间，运单调整代表申请调整时间。
    	t.integer :post_org_id	#收寄机构编号
    	t.string :post_org_no	#收寄机构代码
    	t.string :org_drds_code	#分库机构代码（分库）
    	t.string :post_org_name	#收寄机构名称
    	t.string :sender	#寄件客户名称
    	t.string :sender_linker	#寄件联系人
    	t.string :sender_fixtel	#寄件客户电话
    	t.string :sender_mobile	#寄件客户手机
    	t.string :sender_im_type	#寄件即时通讯类型
    	t.string :sender_im_id	#寄件即时通讯ID
    	t.string :sender_addr	#寄件客户地址
    	t.string :sender_addr_additional	#外文收寄地址
    	t.string :sender_country_no	#寄件国家代码
    	t.string :sender_country_name	#寄件国家名称
    	t.string :sender_province_no	#寄件省份代码
    	t.string :sender_province_name	#寄件省份名称
    	t.string :sender_city_no	#寄件城市代码
    	t.string :sender_city_name	#寄件城市名称
    	t.string :sender_county_no	#寄件区县代码
    	t.string :sender_county_name	#寄件区县名称
    	t.string :sender_district_no	#寄件行政区划
    	t.string :sender_postcode	#寄件邮编
    	t.string :sender_notes	#寄件备注
    	t.string :receiver	#收件客户名称
    	t.string :receiver_linker	#收件联系人
    	t.string :receiver_im_type	#收件即时通讯类型
    	t.string :receiver_im_id	#收件即时通讯ID
    	t.string :receiver_fixtel	#收件客户电话
    	t.string :receiver_mobile	#收件客户手机
    	t.string :receiver_addr	#收件客户地址
    	t.string :receiver_addr_additional	#收件客户附加地址
    	t.string :receiver_country_no	#收件国家代码
    	t.string :receiver_country_name	#收件国家名称
    	t.string :receiver_province_no	#收件省份代码
    	t.string :receiver_province_name	#收件省份名称
    	t.string :receiver_city_no	#收件城市代码
    	t.string :receiver_city_name	#收件城市名称
    	t.string :receiver_county_no	#收件区县代码
    	t.string :receiver_county_name	#收件区县名称
    	t.string :receiver_district_no	#收件行政区划
    	t.string :receiver_postcode	#收件邮编
    	t.string :receiver_notes	#收件备注
    	t.float :real_weight	#实际重量
    	t.float :volume_weight	#体积重
    	t.float :volume	#体积
    	t.float :length	#长
    	t.float :width	#宽
    	t.float :height	#高
    	t.string :packaging	#邮件包装
    	t.string :package_material	#包装材质
    	t.string :goods_desc	#货物描述
    	t.string :contents_type_no	#内件类型代码
    	t.string :contents_type_name	#内件类型名称
    	t.float :contents_weight	#内件商品重量
    	t.string :cod_flag	#代收款标志：0 无，1有
    	t.float :cod_amount	#代收款金额
    	t.string :receipt_flag	#回单标志：0 无，1 电子回单，2面单，3客户单据
    	t.string :receipt_waybill_no	#回单运单号
    	t.float :receipt_fee_amount	#回单费金额
    	t.string :insurance_flag	#保价保险标志：0 无 1 保价 2保险
    	t.float :insurance_amount	#保价保险金额
    	t.float :insurance_premium_amount	#保费金额
    	t.string :battery_flag	#有无电池标志：0 无 1有
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
