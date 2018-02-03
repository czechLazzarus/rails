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

ActiveRecord::Schema.define(version: 20180203221453) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "categories_contacts", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id", "contact_id"], name: "index_categories_contacts_on_category_id_and_contact_id"
    t.index ["contact_id", "category_id"], name: "index_categories_contacts_on_contact_id_and_category_id"
  end

  create_table "categories_email_templates", force: :cascade do |t|
    t.integer "email_template_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts_emails", force: :cascade do |t|
    t.integer "email_id"
    t.integer "contact_id"
    t.boolean "sended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "email_templates", force: :cascade do |t|
    t.string "subject"
    t.text "text"
    t.string "sender"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string "subject"
    t.string "text"
    t.string "plain_text"
    t.string "sender"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_smtps", force: :cascade do |t|
    t.string "username"
    t.string "smtp"
    t.integer "port"
    t.string "protocol", limit: 10
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "email"
    t.index ["user_id"], name: "index_user_smtps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "user_smtp_id"
    t.index ["user_smtp_id"], name: "index_users_on_user_smtp_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
