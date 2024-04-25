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

ActiveRecord::Schema[7.1].define(version: 2024_04_25_100311) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "mortgages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bank_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "property_value"
    t.decimal "total_equity"
    t.float "interest_rate"
    t.decimal "rental_income"
    t.decimal "maintainence_fund"
    t.decimal "other_expenses"
    t.decimal "loan_amount"
    t.decimal "monthly_repayment"
    t.decimal "monthly_cashflow"
    t.index ["bank_id"], name: "index_mortgages_on_bank_id"
    t.index ["user_id"], name: "index_mortgages_on_user_id"
  end

  create_table "personals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personals_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "brokers"
  add_foreign_key "appointments", "users"
  add_foreign_key "mortgages", "banks"
  add_foreign_key "mortgages", "users"
  add_foreign_key "personals", "users"
  add_foreign_key "reviews", "brokers"
  add_foreign_key "reviews", "users"
end
