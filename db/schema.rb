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

ActiveRecord::Schema[7.0].define(version: 2024_07_26_230809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "starting_price_cents", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "end_date"
    t.decimal "current_bid"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_link"
    t.integer "user_id"
    t.string "currency", default: "EUR", null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer "user_id"
    t.integer "auction_item_id"
    t.decimal "amount_cents", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "bid_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency", default: "EUR", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
