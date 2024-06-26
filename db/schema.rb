# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_15_115049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "broker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.text "message"
    t.index ["broker_id"], name: "index_appointments_on_broker_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.decimal "one_year"
    t.decimal "two_years"
    t.decimal "three_years"
    t.string "image_url"
  end

  create_table "brokers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.text "about"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "description"
  end

  create_table "homebuyers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "property_value"
    t.decimal "total_deposit"
    t.float "interest_rate"
    t.decimal "salary"
    t.decimal "other_income"
    t.decimal "loan_amount"
    t.decimal "monthly_repayment"
    t.integer "loan_term"
    t.decimal "living_expenses"
    t.decimal "car_loan_payment"
    t.decimal "other_debts"
    t.decimal "net_disposable_income"
    t.decimal "total_interest_paid"
    t.decimal "total_mortgage_repayment"
    t.decimal "interest_rate_safety"
    t.bigint "rate_id"
    t.decimal "principal_payments", array: true
    t.decimal "interest_payments", array: true
    t.index ["rate_id"], name: "index_homebuyers_on_rate_id"
    t.index ["user_id"], name: "index_homebuyers_on_user_id"
  end

  create_table "mortgages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "property_value"
    t.decimal "total_equity"
    t.float "interest_rate"
    t.decimal "rental_income"
    t.decimal "maintenance_fund"
    t.decimal "other_expenses"
    t.decimal "loan_amount"
    t.decimal "monthly_repayment"
    t.decimal "monthly_cashflow"
    t.bigint "rate_id", null: false
    t.index ["rate_id"], name: "index_mortgages_on_rate_id"
    t.index ["user_id"], name: "index_mortgages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "description"
    t.text "about"
    t.string "address"
    t.string "phone_number"
  end

  create_table "rates", force: :cascade do |t|
    t.decimal "interest_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bank_id", null: false
    t.index ["bank_id"], name: "index_rates_on_bank_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "broker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.integer "rating"
    t.index ["broker_id"], name: "index_reviews_on_broker_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "is_homebuyer", default: false, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "brokers"
  add_foreign_key "appointments", "users"
  add_foreign_key "homebuyers", "rates"
  add_foreign_key "homebuyers", "users"
  add_foreign_key "mortgages", "rates"
  add_foreign_key "mortgages", "users"
  add_foreign_key "rates", "banks"
  add_foreign_key "reviews", "brokers"
  add_foreign_key "reviews", "users"
end
