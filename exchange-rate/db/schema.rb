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

ActiveRecord::Schema[7.0].define(version: 2023_01_18_222501) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.decimal "rate", precision: 10, scale: 6, null: false
    t.bigint "from_currency_id", null: false
    t.bigint "to_currency_id", null: false
    t.datetime "date", null: false
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_currency_id"], name: "index_rates_on_from_currency_id"
    t.index ["to_currency_id"], name: "index_rates_on_to_currency_id"
  end

  add_foreign_key "rates", "currencies", column: "from_currency_id"
  add_foreign_key "rates", "currencies", column: "to_currency_id"
end
