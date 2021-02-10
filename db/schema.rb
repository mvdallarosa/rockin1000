# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_08_094857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborations", force: :cascade do |t|
    t.json "type"
    t.integer "order"
    t.bigint "partner_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_collaborations_on_event_id"
    t.index ["partner_id"], name: "index_collaborations_on_partner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "registration_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registration_id"], name: "index_comments_on_registration_id"
  end

  create_table "events", force: :cascade do |t|
    t.json "title"
    t.json "description"
    t.json "location"
    t.json "city"
    t.string "date"
    t.string "status"
    t.bigint "type_id", null: false
    t.bigint "media_id", null: false
    t.bigint "gallery_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gallery_id"], name: "index_events_on_gallery_id"
    t.index ["media_id"], name: "index_events_on_media_id"
    t.index ["type_id"], name: "index_events_on_type_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "main_participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.json "type"
    t.bigint "event_id", null: false
    t.bigint "media_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_main_participants_on_event_id"
    t.index ["media_id"], name: "index_main_participants_on_media_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "url"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media_collections", force: :cascade do |t|
    t.bigint "media_id", null: false
    t.bigint "gallery_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gallery_id"], name: "index_media_collections_on_gallery_id"
    t.index ["media_id"], name: "index_media_collections_on_media_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.bigint "media_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_id"], name: "index_partners_on_media_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["role_id"], name: "index_registrations_on_role_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.bigint "media_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_songs_on_event_id"
    t.index ["media_id"], name: "index_songs_on_media_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.json "role"
    t.string "linkedin"
    t.json "biography"
    t.bigint "media_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_id"], name: "index_team_members_on_media_id"
  end

  create_table "types", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "email"
    t.string "roles"
    t.bigint "media_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["media_id"], name: "index_users_on_media_id"
  end

  add_foreign_key "collaborations", "events"
  add_foreign_key "collaborations", "partners"
  add_foreign_key "comments", "registrations"
  add_foreign_key "events", "galleries"
  add_foreign_key "events", "media", column: "media_id"
  add_foreign_key "events", "types"
  add_foreign_key "main_participants", "events"
  add_foreign_key "main_participants", "media", column: "media_id"
  add_foreign_key "media_collections", "galleries"
  add_foreign_key "media_collections", "media", column: "media_id"
  add_foreign_key "partners", "media", column: "media_id"
  add_foreign_key "registrations", "events"
  add_foreign_key "registrations", "roles"
  add_foreign_key "registrations", "users"
  add_foreign_key "songs", "events"
  add_foreign_key "songs", "media", column: "media_id"
  add_foreign_key "team_members", "media", column: "media_id"
  add_foreign_key "users", "media", column: "media_id"
end
