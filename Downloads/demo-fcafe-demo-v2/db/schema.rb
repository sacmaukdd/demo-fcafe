# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170209065004) do

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_albums_on_shop_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",      default: 0
    t.integer  "shop_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["shop_id"], name: "index_categories_on_shop_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id", using: :btree
    t.index ["shop_id"], name: "index_comments_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "percen"
    t.date     "begin_time"
    t.date     "end_time"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_coupons_on_shop_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "picture"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_images_on_album_id", using: :btree
  end

  create_table "order_product_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "quantity"
    t.integer  "price"
    t.integer  "product_id"
    t.integer  "order_product_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_product_id"], name: "index_order_product_items_on_order_product_id", using: :btree
    t.index ["product_id"], name: "index_order_product_items_on_product_id", using: :btree
  end

  create_table "order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "total_price"
    t.integer  "user_id"
    t.integer  "table_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["table_id"], name: "index_order_products_on_table_id", using: :btree
    t.index ["user_id"], name: "index_order_products_on_user_id", using: :btree
  end

  create_table "order_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "begin_time"
    t.date     "end_time"
    t.integer  "user_id"
    t.integer  "table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_order_tables_on_table_id", using: :btree
    t.index ["user_id"], name: "index_order_tables_on_user_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.integer  "category_id"
    t.integer  "album_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["album_id"], name: "index_products_on_album_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "num_rate"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_rates_on_product_id", using: :btree
    t.index ["shop_id"], name: "index_rates_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_rates_on_user_id", using: :btree
  end

  create_table "shop_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.string   "avatar"
    t.integer  "status",       default: 0
    t.integer  "user_id"
    t.integer  "shop_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["shop_type_id"], name: "index_shops_on_shop_type_id", using: :btree
    t.index ["user_id"], name: "index_shops_on_user_id", using: :btree
  end

  create_table "suggestions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status",      default: 0
    t.string   "image"
    t.string   "deleted_at"
    t.integer  "shop_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["shop_id"], name: "index_suggestions_on_shop_id", using: :btree
    t.index ["user_id"], name: "index_suggestions_on_user_id", using: :btree
  end

  create_table "tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "status"
    t.integer  "num_chair"
    t.string   "avatar"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_tables_on_shop_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "user_name"
    t.string   "avatar"
    t.integer  "role",                   default: 0
    t.string   "phone_number"
    t.string   "address"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "albums", "shops"
  add_foreign_key "categories", "shops"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "shops"
  add_foreign_key "comments", "users"
  add_foreign_key "coupons", "shops"
  add_foreign_key "images", "albums"
  add_foreign_key "order_product_items", "order_products"
  add_foreign_key "order_product_items", "products"
  add_foreign_key "order_products", "tables"
  add_foreign_key "order_products", "users"
  add_foreign_key "order_tables", "tables"
  add_foreign_key "order_tables", "users"
  add_foreign_key "products", "albums"
  add_foreign_key "products", "categories"
  add_foreign_key "rates", "products"
  add_foreign_key "rates", "shops"
  add_foreign_key "rates", "users"
  add_foreign_key "shops", "shop_types"
  add_foreign_key "shops", "users"
  add_foreign_key "suggestions", "shops"
  add_foreign_key "suggestions", "users"
  add_foreign_key "tables", "shops"
end
