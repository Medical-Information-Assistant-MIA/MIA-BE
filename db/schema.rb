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

ActiveRecord::Schema[7.0].define(version: 20_230_516_003_847) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_conditions_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.bigint "condition_id", null: false
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_doctors_on_condition_id"
  end

  create_table "health_events", force: :cascade do |t|
    t.bigint "condition_id", null: false
    t.text "note"
    t.date "date"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_health_events_on_condition_id"
  end

  create_table "medications", force: :cascade do |t|
    t.bigint "condition_id", null: false
    t.string "name"
    t.date "date_prescribed"
    t.string "dosage"
    t.string "frequency"
    t.string "prescribed_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_medications_on_condition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conditions", "users"
  add_foreign_key "doctors", "conditions"
  add_foreign_key "health_events", "conditions"
  add_foreign_key "medications", "conditions"
end
