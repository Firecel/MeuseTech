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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160411094845) do

  create_table "actions", force: :cascade do |t|
    t.string "label"
  end

  create_table "articles", force: :cascade do |t|
    t.text    "contenu"
    t.integer "publication_id"
  end

  create_table "articles_media", id: false, force: :cascade do |t|
    t.integer "medium_id",  null: false
    t.integer "article_id", null: false
  end

  create_table "attachements", force: :cascade do |t|
    t.string "label"
  end

  create_table "commentaires", force: :cascade do |t|
    t.integer  "interaction_id"
    t.string   "contenu"
    t.datetime "date"
  end

  create_table "interactions", force: :cascade do |t|
    t.string  "type"
    t.integer "article_id"
    t.integer "user_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "type"
    t.string "chemin"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "action_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "commune"
    t.integer "code_postal"
    t.string  "pays"
    t.integer "attachement_id"
    t.integer "nb_commentaires"
    t.integer "nb_projets_suivis"
    t.integer "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "projets", force: :cascade do |t|
    t.string  "localisation"
    t.string  "theme"
    t.date    "date_lancement"
    t.text    "besoins"
    t.integer "article_id"
    t.string  "territoire"
    t.string  "etat_avancement"
    t.string  "lien_url"
  end

  create_table "publications", force: :cascade do |t|
    t.boolean "online"
    t.integer "user_id"
    t.date    "online_date"
    t.text    "titre"
  end

  create_table "roles", force: :cascade do |t|
    t.string "label"
  end

  create_table "sondages", force: :cascade do |t|
    t.integer  "publication_id"
    t.datetime "date_fin"
  end

  create_table "survey_answers", force: :cascade do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: :cascade do |t|
    t.integer "participant_id"
    t.string  "participant_type"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
  end

  create_table "survey_options", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "weight",      default: 0
    t.string   "text"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "attempts_number", default: 0
    t.boolean  "finished",        default: false
    t.boolean  "active",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_type"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "nom"
    t.string   "prenom"
    t.string   "pseudo"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
