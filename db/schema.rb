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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130103072124) do

  create_table "admins", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "login",               :default => "", :null => false
    t.string   "firstname"
  end

  add_index "admins", ["login"], :name => "index_admins_on_login", :unique => true

  create_table "daily_transfers", :force => true do |t|
    t.integer  "subscription_id"
    t.date     "date"
    t.integer  "lender_id"
    t.integer  "borrower_id"
    t.boolean  "payment_status",  :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "booking_status",  :default => false
    t.string   "borrower_name"
  end

  create_table "holidays", :force => true do |t|
    t.date     "date"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subscription_types", :force => true do |t|
    t.date     "month"
    t.integer  "number_of_days"
    t.integer  "amount_per_day", :default => 45
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "subscription_types_users", :id => false, :force => true do |t|
    t.integer "subscription_type_id"
    t.integer "user_id"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subscription_type_id"
    t.integer  "total_amount"
    t.boolean  "payment_status",       :default => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "login",               :default => "", :null => false
    t.string   "firstname"
    t.integer  "subscription_id"
    t.integer  "dailytransfer_id"
    t.string   "fullname"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
