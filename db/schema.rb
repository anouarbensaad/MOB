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

ActiveRecord::Schema.define(version: 2018_07_27_183543) do

  create_table "pannes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "description"
    t.string "type_panne"
    t.string "laboratoire"
    t.string "type_Composant"
    t.string "id_Composant"
    t.bigint "prof_id"
    t.bigint "tech_id"
    t.text "tech_comment"
    t.string "panne_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prof_id", "created_at"], name: "index_pannes_on_prof_id_and_created_at"
    t.index ["prof_id"], name: "index_pannes_on_prof_id"
    t.index ["tech_id", "created_at"], name: "index_pannes_on_tech_id_and_created_at"
    t.index ["tech_id"], name: "index_pannes_on_tech_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "login"
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "utype"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login"
  end

end
