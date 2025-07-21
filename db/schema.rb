# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_07_21_013347) do

  create_table "interface_logs", force: :cascade do |t|
    t.string "controller_name"
    t.string "action_name"
    t.text "request_header"
    t.text "request_body"
    t.text "response_header"
    t.text "response_body"
    t.text "params"
    t.string "business_id"
    t.string "unit_id"
    t.string "request_ip"
    t.string "status"
    t.integer "parent_id", precision: 38
    t.string "parent_type"
    t.string "business_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "request_url"
    t.string "created_day"
    t.text "error_msg"
    t.index ["business_code"], name: "index_interface_logs_on_business_code"
  end

  create_table "interface_senders", force: :cascade do |t|
    t.string "url"
    t.string "host"
    t.string "port"
    t.string "interface_type"
    t.string "http_type"
    t.string "callback_class"
    t.string "callback_method"
    t.text "callback_params"
    t.string "status"
    t.integer "send_times", precision: 38
    t.datetime "next_time", precision: 6
    t.text "header"
    t.text "body"
    t.datetime "last_time", precision: 6
    t.text "last_response"
    t.text "last_header"
    t.string "interface_code"
    t.integer "max_times", precision: 38
    t.integer "interval", precision: 38
    t.text "error_msg"
    t.string "parent_class"
    t.integer "parent_id", precision: 38
    t.integer "unit_id", precision: 38
    t.integer "business_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.index ["created_at"], name: "index_interface_senders_on_created_at"
    t.index ["parent_id"], name: "index_interface_senders_on_parent_id"
    t.index ["status"], name: "index_interface_senders_on_status"
  end

  create_table "mail_trace_details", force: :cascade do |t|
    t.integer "mail_trace_id", precision: 38
    t.string "traces", limit: 4000
    t.string "created_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_date"
    t.index ["mail_trace_id"], name: "index_mail_trace_details_on_mail_trace_id"
  end

  create_table "mail_traces", force: :cascade do |t|
    t.string "mail_no"
    t.string "result"
    t.string "status"
    t.text "traces"
    t.boolean "is_posting"
    t.datetime "operated_at", precision: 6
    t.datetime "last_received_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.string "last_trace"
    t.index ["mail_no"], name: "index_mail_traces_on_mail_no", unique: true
    t.index ["status"], name: "index_mail_traces_on_status"
  end

  create_table "pkp_waybill_bases", force: :cascade do |t|
    t.integer "pkp_waybill_id", precision: 38
    t.integer "order_id", precision: 38
    t.string "logistics_order_no"
    t.string "inner_channel"
    t.integer "base_product_id", precision: 38
    t.string "base_product_no"
    t.string "base_product_name"
    t.integer "biz_product_id", precision: 38
    t.string "biz_product_no"
    t.string "biz_product_name"
    t.string "product_type"
    t.string "product_reach_area"
    t.string "contents_attribute"
    t.string "cmd_code"
    t.string "manual_charge_reason"
    t.string "time_limit"
    t.string "io_type"
    t.string "ecommerce_no"
    t.string "waybill_type"
    t.string "waybill_no"
    t.string "pre_waybill_no"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.integer "post_person_id", precision: 38
    t.string "post_person_no"
    t.string "post_person_name"
    t.string "post_person_mobile"
    t.string "sender_type"
    t.integer "sender_id", precision: 38
    t.string "sender_no"
    t.string "sender"
    t.integer "sender_warehouse_id", precision: 38
    t.string "sender_warehouse_name"
    t.string "sender_linker"
    t.string "sender_fixtel"
    t.string "sender_mobile"
    t.string "sender_im_type"
    t.string "sender_im_id"
    t.string "sender_id_type"
    t.string "sender_id_no"
    t.string "sender_id_encrypted_code"
    t.string "sender_agent_id_type"
    t.string "sender_agent_id_no"
    t.string "sender_id_encrypted_code_agent"
    t.string "sender_addr"
    t.string "sender_addr_additional"
    t.string "sender_country_no"
    t.string "sender_country_name"
    t.string "sender_province_no"
    t.string "sender_province_name"
    t.string "sender_city_no"
    t.string "sender_city_name"
    t.string "sender_county_no"
    t.string "sender_county_name"
    t.string "sender_district_no"
    t.string "sender_postcode"
    t.string "sender_gis"
    t.string "sender_notes"
    t.string "registered_customer_no"
    t.string "receiver_type"
    t.integer "receiver_id", precision: 38
    t.string "receiver_no"
    t.string "receiver"
    t.integer "receiver_warehouse_id", precision: 38
    t.string "receiver_warehouse_name"
    t.string "receiver_linker"
    t.string "receiver_im_type"
    t.string "receiver_im_id"
    t.string "receiver_fixtel"
    t.string "receiver_mobile"
    t.string "receiver_addr"
    t.string "receiver_addr_additional"
    t.string "receiver_country_no"
    t.string "receiver_country_name"
    t.string "receiver_province_no"
    t.string "receiver_province_name"
    t.string "receiver_city_no"
    t.string "receiver_city_name"
    t.string "receiver_county_no"
    t.string "receiver_county_name"
    t.string "receiver_district_no"
    t.string "receiver_postcode"
    t.string "receiver_gis"
    t.string "receiver_notes"
    t.integer "customer_manager_id", precision: 38
    t.string "customer_manager_no"
    t.string "customer_manager_name"
    t.integer "salesman_id", precision: 38
    t.string "salesman_no"
    t.string "salesman_name"
    t.integer "order_weight", limit: 8, precision: 8
    t.integer "real_weight", limit: 8, precision: 8
    t.integer "fee_weight", limit: 8, precision: 8
    t.integer "volume_weight", limit: 8, precision: 8
    t.integer "volume", limit: 8, precision: 8
    t.integer "length", limit: 8, precision: 8
    t.integer "width", limit: 8, precision: 8
    t.integer "height", limit: 8, precision: 8
    t.integer "quantity", precision: 38
    t.string "packaging"
    t.string "package_material"
    t.string "goods_desc"
    t.string "contents_type_no"
    t.string "contents_type_name"
    t.integer "contents_weight", limit: 8, precision: 8
    t.integer "contents_quantity", precision: 38
    t.string "cod_flag"
    t.decimal "cod_amount", precision: 12, scale: 2
    t.string "receipt_flag"
    t.string "receipt_waybill_no"
    t.decimal "receipt_fee_amount", precision: 12, scale: 2
    t.string "insurance_flag"
    t.decimal "insurance_amount", precision: 12, scale: 2
    t.decimal "insurance_premium_amount", precision: 12, scale: 2
    t.string "valuable_flag"
    t.string "transfer_type"
    t.string "pickup_type"
    t.string "allow_fee_flag"
    t.string "is_feed_flag"
    t.datetime "fee_date", precision: 6
    t.decimal "postage_total", precision: 12, scale: 2
    t.decimal "postage_standard", precision: 12, scale: 2
    t.decimal "postage_paid", precision: 12, scale: 2
    t.decimal "postage_other", precision: 12, scale: 2
    t.string "payment_mode"
    t.decimal "discount_rate", precision: 6, scale: 2
    t.string "settlement_mode"
    t.string "payment_state"
    t.datetime "payment_date", precision: 6
    t.string "payment_id"
    t.string "is_advance_flag"
    t.string "deliver_type"
    t.string "deliver_sign"
    t.string "deliver_date"
    t.string "deliver_notes"
    t.datetime "deliver_pre_date", precision: 6
    t.string "battery_flag"
    t.string "workbench"
    t.string "electronic_preferential_no"
    t.decimal "electronic_preferential_amount", precision: 12, scale: 2
    t.string "pickup_attribute"
    t.string "adjust_type"
    t.decimal "postage_revoke", precision: 12, scale: 2
    t.string "print_flag"
    t.datetime "print_date", precision: 6
    t.integer "print_times", precision: 38
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.string "declare_source"
    t.string "declare_type"
    t.string "declare_curr_code"
    t.string "reserved1"
    t.string "reserved2"
    t.string "reserved3"
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["sender_no"], name: "index_pkp_waybill_bases_on_sender_no"
    t.index ["waybill_no"], name: "index_pkp_waybill_bases_on_waybill_no"
  end

  create_table "pkp_waybill_bills", force: :cascade do |t|
    t.integer "waybill_bill_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.string "waybill_no"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.datetime "c_favourable_effect_time", precision: 6
    t.string "customer_preferential_type"
    t.string "customers_preferential_id"
    t.float "standard_rates_start"
    t.float "standard_rates_continue"
    t.integer "p_cumulative_startnum", precision: 38
    t.integer "preferential_cumulative_endnum", precision: 38
    t.integer "preferential_cumulative_num", precision: 38
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_bills_on_waybill_no"
  end

  create_table "pkp_waybill_bizs", force: :cascade do |t|
    t.integer "waybill_biz_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.integer "order_id", precision: 38
    t.integer "base_product_id", precision: 38
    t.string "base_product_no"
    t.string "base_product_name"
    t.integer "biz_product_id", precision: 38
    t.string "biz_product_no"
    t.string "biz_product_name"
    t.string "io_type"
    t.string "waybill_no"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.integer "post_person_id", precision: 38
    t.string "post_person_no"
    t.string "post_person_name"
    t.string "post_person_mobile"
    t.integer "pickup_person_id", precision: 38
    t.string "pickup_person_no"
    t.string "pickup_person_name"
    t.string "pickup_person_mobile"
    t.integer "teamwk_pickup_person_id", precision: 38
    t.string "teamwk_pickup_person_no"
    t.string "teamwk_pickup_person_name"
    t.string "teamwk_pickup_person_mobile"
    t.datetime "pickup_date", precision: 6
    t.datetime "shuttle_bus_date", precision: 6
    t.string "sender_type"
    t.integer "sender_id", precision: 38
    t.string "sender_no"
    t.string "sender"
    t.integer "sender_warehouse_id", precision: 38
    t.string "sender_warehouse_name"
    t.string "sender_linker"
    t.string "sender_fixtel"
    t.string "sender_mobile"
    t.string "sender_im_type"
    t.string "sender_im_id"
    t.string "sender_addr"
    t.string "sender_addr_additional"
    t.string "sender_district_no"
    t.string "sender_postcode"
    t.string "sender_notes"
    t.integer "real_weight", limit: 8, precision: 8
    t.string "post_state"
    t.string "post_notes"
    t.string "allow_sealing_flag"
    t.datetime "expect_sealing_date", precision: 6
    t.string "allow_deliver_flag"
    t.string "need_reapply_type_flag"
    t.string "reapply_type_fulfil_flag"
    t.string "post_batch_id"
    t.string "one_bill_flag"
    t.string "one_bill_main_waybill_no"
    t.string "one_bill_fee_type"
    t.string "distributive_center_no"
    t.string "distributive_center_name"
    t.string "p_export_center_org_no"
    t.string "p_export_center_org_name"
    t.string "export_center_org_no"
    t.string "export_center_org_name"
    t.string "p_import_central_org_no"
    t.string "p_import_central_org_name"
    t.string "import_central_org_no"
    t.string "import_central_org_name"
    t.string "receiver_country_no"
    t.string "receiver_country_name"
    t.string "receiver_arrive_org_no"
    t.string "receiver_arrive_org_name"
    t.string "receiver_seal_arrive_org_no"
    t.string "receiver_seal_arrive_org_name"
    t.string "seal_arrive_org_no"
    t.string "seal_arrive_org_name"
    t.string "seal_arrive_area_no"
    t.string "deliver_org_no"
    t.string "deliver_org_name"
    t.string "deliver_section"
    t.string "deliver_section_name"
    t.string "deliver_take_org_no"
    t.string "deliver_take_org_name"
    t.string "export_customs_no"
    t.string "export_customs_name"
    t.string "export_interchange_no"
    t.string "export_interchange_name"
    t.string "the_org_grid_no"
    t.string "the_org_grid_name"
    t.string "export_grid_no"
    t.string "export_grid_name"
    t.string "import_grid_no"
    t.string "import_grid_name"
    t.string "straight_seal_flag"
    t.string "this_turn_flag"
    t.string "single_seal_flag"
    t.string "sorting_code"
    t.string "wms_out_batch_no"
    t.string "s_handling_transportation"
    t.string "processing_attribute1"
    t.string "processing_attribute2"
    t.string "pickup_attribute"
    t.string "deliver_attribute"
    t.string "workbench"
    t.string "product_reach_area"
    t.string "contents_attribute"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_bizs_on_waybill_no"
  end

  create_table "pkp_waybill_cargos", force: :cascade do |t|
    t.integer "waybill_cargo_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.string "waybill_no"
    t.string "cargo_serial"
    t.string "cargo_type_no"
    t.string "cargo_type_name"
    t.string "cargo_category_id"
    t.string "cargo_category_name"
    t.string "cargo_no"
    t.string "cargo_name"
    t.string "cargo_name_en"
    t.string "cargo_origin_no"
    t.string "cargo_origin_name"
    t.string "cargo_barcode"
    t.string "cargo_measure_unit"
    t.string "status"
    t.float "volume"
    t.float "weight"
    t.integer "quantity", precision: 38
    t.string "packaging"
    t.string "package_status"
    t.string "move_notes"
    t.float "cargo_value"
    t.float "cargo_price"
    t.float "cargo_purchasing_price"
    t.float "cargo_total_price"
    t.float "cargo_total_purchasing_price"
    t.string "notes"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_cargos_on_waybill_no"
  end

  create_table "pkp_waybill_deliveries", force: :cascade do |t|
    t.string "waybill_no"
    t.string "post_org_no"
    t.string "post_org_name"
    t.string "sender"
    t.string "sender_linker"
    t.string "sender_mobile"
    t.string "sender_id_no"
    t.string "sender_addr"
    t.string "receiver_linker"
    t.string "receiver_mobile"
    t.string "receiver_addr"
    t.string "receiver_addr_additional"
    t.integer "fee_weight", limit: 8, precision: 8
    t.decimal "postage_paid", precision: 12, scale: 2
    t.string "receiver_gis"
    t.string "dlv_org_no"
    t.string "dlv_org_name"
    t.string "dlv_operator_name"
    t.string "status", default: "waiting"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pkp_waybill_fees", force: :cascade do |t|
    t.integer "waybill_fee_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.string "waybill_no"
    t.string "item_no"
    t.string "item_name"
    t.float "item_amount"
    t.string "payment_mode"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_fees_on_waybill_no"
  end

  create_table "pkp_waybill_mores", force: :cascade do |t|
    t.integer "waybill_more_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.integer "sub_waybill_id", precision: 38
    t.string "waybill_no"
    t.string "main_waybill_no"
    t.string "sub_waybill_no"
    t.float "one_bill_total_weight"
    t.integer "one_bill_total_number", precision: 38
    t.string "one_bill_flag"
    t.string "spilt_delivery_flag"
    t.float "real_weight"
    t.float "volume_weight"
    t.float "fee_weight"
    t.float "volume"
    t.float "length"
    t.float "width"
    t.float "height"
    t.integer "serial_no", precision: 38
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_mores_on_waybill_no"
  end

  create_table "pkp_waybill_packages", force: :cascade do |t|
    t.integer "waybill_package_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.string "waybill_no"
    t.string "package_material_type_no"
    t.string "package_material_type_name"
    t.string "package_material_no"
    t.string "package_material_name"
    t.integer "quantity", precision: 38
    t.float "package_material_price"
    t.string "package_material_spec"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_packages_on_waybill_no"
  end

  create_table "pkp_waybill_payments", force: :cascade do |t|
    t.integer "waybill_payment_id", precision: 38
    t.integer "pkp_waybill_id", precision: 38
    t.string "waybill_no"
    t.string "payment_type"
    t.float "payment_amount"
    t.float "union_payment_amount"
    t.string "tran_id"
    t.string "payment_account"
    t.datetime "payment_date", precision: 6
    t.string "payment_state"
    t.string "payment_link"
    t.string "for_the_account"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_payments_on_waybill_no"
  end

  create_table "pkp_waybill_scans", force: :cascade do |t|
    t.integer "waybill_scan_id", precision: 38
    t.string "waybill_no"
    t.datetime "repeat_record_date", precision: 6
    t.integer "repeat_record_person_id", precision: 38
    t.string "repeat_record_person_no"
    t.string "repeat_record_person_name"
    t.datetime "biz_occur_date", precision: 6
    t.integer "post_org_id", precision: 38
    t.string "post_org_no"
    t.string "org_drds_code"
    t.string "post_org_name"
    t.string "sender"
    t.string "sender_linker"
    t.string "sender_fixtel"
    t.string "sender_mobile"
    t.string "sender_im_type"
    t.string "sender_im_id"
    t.string "sender_addr"
    t.string "sender_addr_additional"
    t.string "sender_country_no"
    t.string "sender_country_name"
    t.string "sender_province_no"
    t.string "sender_province_name"
    t.string "sender_city_no"
    t.string "sender_city_name"
    t.string "sender_county_no"
    t.string "sender_county_name"
    t.string "sender_district_no"
    t.string "sender_postcode"
    t.string "sender_notes"
    t.string "receiver"
    t.string "receiver_linker"
    t.string "receiver_im_type"
    t.string "receiver_im_id"
    t.string "receiver_fixtel"
    t.string "receiver_mobile"
    t.string "receiver_addr"
    t.string "receiver_addr_additional"
    t.string "receiver_country_no"
    t.string "receiver_country_name"
    t.string "receiver_province_no"
    t.string "receiver_province_name"
    t.string "receiver_city_no"
    t.string "receiver_city_name"
    t.string "receiver_county_no"
    t.string "receiver_county_name"
    t.string "receiver_district_no"
    t.string "receiver_postcode"
    t.string "receiver_notes"
    t.float "real_weight"
    t.float "volume_weight"
    t.float "volume"
    t.float "length"
    t.float "width"
    t.float "height"
    t.string "packaging"
    t.string "package_material"
    t.string "goods_desc"
    t.string "contents_type_no"
    t.string "contents_type_name"
    t.float "contents_weight"
    t.string "cod_flag"
    t.float "cod_amount"
    t.string "receipt_flag"
    t.string "receipt_waybill_no"
    t.float "receipt_fee_amount"
    t.string "insurance_flag"
    t.float "insurance_amount"
    t.float "insurance_premium_amount"
    t.string "battery_flag"
    t.string "is_deleted"
    t.integer "create_user_id", precision: 38
    t.datetime "gmt_created", precision: 6
    t.integer "modify_user_id", precision: 38
    t.datetime "gmt_modified", precision: 6
    t.integer "reserved1", precision: 38
    t.integer "reserved2", precision: 38
    t.integer "reserved3", precision: 38
    t.string "reserved4"
    t.string "reserved5"
    t.string "reserved6"
    t.string "reserved7"
    t.string "reserved8"
    t.datetime "reserved9", precision: 6
    t.text "reserved10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_day"
    t.string "created_date"
    t.index ["waybill_no"], name: "index_pkp_waybill_scans_on_waybill_no"
  end

  create_table "test", id: :decimal, force: :cascade do |t|
  end

end
