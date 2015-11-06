# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151106173543) do

  create_table "accidents", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "location_id", limit: 4
    t.text     "desctiption", limit: 65535
    t.integer  "status_id",   limit: 4
    t.string   "mode",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "repman_id",   limit: 255
  end

  create_table "actions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "description", limit: 255
    t.integer  "accident_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status_id",   limit: 4
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.string   "adres",                  limit: 255
    t.integer  "tel",                    limit: 4
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "adoptions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "explo_id",    limit: 4
    t.integer  "quantity",    limit: 4
    t.string   "description", limit: 255
    t.string   "name",        limit: 255
    t.string   "sn",          limit: 255
    t.string   "regal",       limit: 255
    t.string   "polka",       limit: 255
    t.string   "unit_id",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "subcategory_id",      limit: 4
    t.integer  "category_id",         limit: 4
  end

  create_table "explos", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "sn",                  limit: 255
    t.string   "regal",               limit: 255
    t.string   "polka",               limit: 255
    t.integer  "quantity",            limit: 4
    t.string   "description",         limit: 255
    t.string   "unit_id",             limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "adoption_id",         limit: 4
    t.integer  "explo_id",            limit: 4
    t.integer  "subcategory_id",      limit: 4
    t.integer  "category_id",         limit: 4
    t.integer  "subsubcategory_id",   limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "sn",                  limit: 255
    t.integer  "quantity",            limit: 4
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "category_id",         limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "unit_id",             limit: 4
    t.integer  "location_id",         limit: 4
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "hall",        limit: 255
    t.string   "city",        limit: 255
    t.text     "adress",      limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "desctiption",       limit: 65535
    t.integer  "subsubcategory_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "category_id",       limit: 4
  end

  create_table "subsubcategories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "desctiption",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "subcategory_id", limit: 4
  end

  create_table "tobuys", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "desctiption", limit: 65535
    t.integer  "quantity",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
  end

  create_table "units", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "unit",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "surname",             limit: 255
    t.string   "proffesion",          limit: 255
    t.string   "email",               limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest",     limit: 255
    t.string   "remember_digest",     limit: 255
    t.boolean  "admin"
    t.boolean  "office"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "wydanies", force: :cascade do |t|
    t.integer  "explo_id",    limit: 4
    t.integer  "quantity",    limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "accept_id",   limit: 4
    t.string   "accept_user", limit: 255
  end

  create_table "wzs", force: :cascade do |t|
    t.string   "user_id",       limit: 255
    t.string   "item_id",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "location_id",   limit: 4
    t.string   "admin_user_id", limit: 255
    t.integer  "status_id",     limit: 4
    t.string   "description",   limit: 255
  end

end
