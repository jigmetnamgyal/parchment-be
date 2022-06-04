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

ActiveRecord::Schema[7.0].define(version: 2022_06_04_131759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "document_url", default: [], null: false, array: true
    t.string "institution_name", default: "", null: false
    t.string "email_address", default: "", null: false
    t.integer "institution_type", null: false
    t.integer "kyc_status", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_url"], name: "index_profiles_on_document_url", using: :gin
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "wallet_address", null: false
    t.string "jti", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["wallet_address"], name: "index_users_on_wallet_address", unique: true
  end

end
