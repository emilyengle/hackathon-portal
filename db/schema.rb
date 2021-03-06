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

ActiveRecord::Schema.define(version: 20161009011700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "perk_pledges", force: :cascade do |t|
    t.integer  "perk_id"
    t.integer  "pledge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perk_id"], name: "index_perk_pledges_on_perk_id", using: :btree
    t.index ["pledge_id"], name: "index_perk_pledges_on_pledge_id", using: :btree
  end

  create_table "perks", force: :cascade do |t|
    t.string   "name",                    null: false
    t.text     "description",             null: false
    t.integer  "level",       default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "level",                       null: false
    t.integer  "pledge_type",     default: 0, null: false
    t.integer  "amount_pledged"
    t.integer  "amount_paid"
    t.string   "inkind_pledged"
    t.string   "inkind_received"
    t.integer  "sponsor_id",                  null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["sponsor_id"], name: "index_pledges_on_sponsor_id", using: :btree
  end

  create_table "sponsor_tasks", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "sponsor_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "completed",  default: false
    t.index ["sponsor_id"], name: "index_sponsor_tasks_on_sponsor_id", using: :btree
    t.index ["task_id"], name: "index_sponsor_tasks_on_task_id", using: :btree
  end

  create_table "sponsor_users", force: :cascade do |t|
    t.integer  "sponsor_id"
    t.integer  "user_id"
    t.integer  "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_sponsor_users_on_sponsor_id", using: :btree
    t.index ["user_id"], name: "index_sponsor_users_on_user_id", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.string  "name",                                         null: false
    t.string  "logo"
    t.string  "registration_password",                        null: false
    t.boolean "active",                       default: true
    t.string  "inactive_reason"
    t.integer "fiscal_year_start_month"
    t.text    "notes",                                        null: false
    t.string  "contact_first_name"
    t.string  "contact_last_name"
    t.string  "contact_email"
    t.boolean "contact_information_received", default: false
    t.text    "challenge"
    t.boolean "challenge_received",           default: false
    t.text    "prehype_event"
    t.boolean "prehype_event_received",       default: false
    t.text    "swag"
    t.boolean "swag_received",                default: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.string   "related_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                  null: false
    t.string   "last_name",                   null: false
    t.string   "email",                       null: false
    t.string   "username",                    null: false
    t.string   "password_digest",             null: false
    t.bigint   "phone_number"
    t.integer  "user_type",       default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "perk_pledges", "perks"
  add_foreign_key "perk_pledges", "pledges"
  add_foreign_key "pledges", "sponsors"
  add_foreign_key "sponsor_tasks", "sponsors"
  add_foreign_key "sponsor_tasks", "tasks"
  add_foreign_key "sponsor_users", "sponsors"
  add_foreign_key "sponsor_users", "users"
end
