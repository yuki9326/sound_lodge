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

ActiveRecord::Schema.define(version: 2021_09_05_113909) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "end_user_id"
    t.string "subject", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.text "mail_body", null: false
    t.text "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "username", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "end_user_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "image_id"
    t.integer "room_id"
    t.integer "end_user_id"
    t.boolean "is_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_messages_on_end_user_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "musician_favorites", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "musician_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_musician_favorites_on_end_user_id"
    t.index ["musician_profile_id"], name: "index_musician_favorites_on_musician_profile_id"
  end

  create_table "musician_profiles", force: :cascade do |t|
    t.integer "genre", null: false
    t.integer "end_user_id", null: false
    t.integer "musician_review_id"
    t.integer "area", default: 0, null: false
    t.string "instrument", null: false
    t.integer "total_member", null: false
    t.boolean "is_vocal", default: true, null: false
    t.integer "video_id"
    t.text "introduction"
    t.integer "price", null: false
    t.float "rate"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musician_reviews", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "musician_profile_id"
    t.float "rate", default: 0.0
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_musician_reviews_on_end_user_id"
    t.index ["musician_profile_id"], name: "index_musician_reviews_on_musician_profile_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "message_id"
    t.integer "musician_favorite_id"
    t.integer "musician_review_id"
    t.integer "shop_favorite_id"
    t.integer "shop_review_id"
    t.boolean "is_read", default: false, null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_users", force: :cascade do |t|
    t.integer "room_id"
    t.integer "end_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_room_users_on_end_user_id"
    t.index ["room_id"], name: "index_room_users_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_favorites", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "shop_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_shop_favorites_on_end_user_id"
    t.index ["shop_profile_id"], name: "index_shop_favorites_on_shop_profile_id"
  end

  create_table "shop_profiles", force: :cascade do |t|
    t.integer "genre", null: false
    t.integer "end_user_id", null: false
    t.integer "shop_review_id"
    t.string "shop_name", null: false
    t.integer "area", default: 0, null: false
    t.boolean "is_vocal", default: true, null: false
    t.string "shop_image_id"
    t.string "image_id"
    t.text "audio_equipment"
    t.text "introduction"
    t.integer "price", null: false
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_reviews", force: :cascade do |t|
    t.integer "end_user_id"
    t.integer "shop_profile_id"
    t.float "rate", default: 0.0
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_shop_reviews_on_end_user_id"
    t.index ["shop_profile_id"], name: "index_shop_reviews_on_shop_profile_id"
  end

end
