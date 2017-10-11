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

ActiveRecord::Schema.define(version: 20171010144749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line_1"
    t.string "line_2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_addresses_on_application_id"
  end

  create_table "applications", force: :cascade do |t|
    t.integer "status", default: 0
    t.text "steps", default: [], array: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.decimal "amount", precision: 15, scale: 2
    t.datetime "expiration"
    t.bigint "recruitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruitment_id"], name: "index_coupons_on_recruitment_id"
  end

  create_table "demographics", force: :cascade do |t|
    t.date "birthdate"
    t.integer "gender"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_demographics_on_application_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "initiative"
    t.integer "collaboration"
    t.integer "organization"
    t.integer "diversity"
    t.integer "resilience"
    t.integer "logic"
    t.bigint "application_id"
    t.bigint "evaluator_id"
    t.index ["application_id"], name: "index_evaluations_on_application_id"
    t.index ["evaluator_id"], name: "index_evaluations_on_evaluator_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "education"
    t.decimal "income", precision: 15, scale: 2
    t.boolean "technical_experience"
    t.integer "objective"
    t.string "resume_id"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resume_filename"
    t.index ["application_id"], name: "index_experiences_on_application_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.integer "referral"
    t.bigint "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_recruitments_on_application_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "addresses", "applications"
  add_foreign_key "applications", "users"
  add_foreign_key "coupons", "recruitments"
  add_foreign_key "demographics", "applications"
  add_foreign_key "evaluations", "applications"
  add_foreign_key "evaluations", "users", column: "evaluator_id"
  add_foreign_key "experiences", "applications"
  add_foreign_key "recruitments", "applications"
end
