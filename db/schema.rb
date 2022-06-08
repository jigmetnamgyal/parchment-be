# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_608_164_051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'certificates', force: :cascade do |t|
    t.string 'institution_name'
    t.string 'major'
    t.string 'awarded_to'
    t.string 'description'
    t.string 'institution_logo_url'
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'year_awarded'
    t.string 'qr_code_url'
    t.index ['user_id'], name: 'index_certificates_on_user_id'
  end

  create_table 'meta_data', force: :cascade do |t|
    t.string 'image_url', null: false
    t.string 'description', null: false
    t.string 'name', null: false
    t.jsonb 'traits', default: [], array: true
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_meta_data_on_user_id'
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'institution_name', default: '', null: false
    t.string 'email_address', default: '', null: false
    t.integer 'institution_type', null: false
    t.integer 'kyc_status', default: 0, null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'document_url', default: [], array: true
    t.index ['document_url'], name: 'index_profiles_on_document_url', using: :gin
    t.index ['user_id'], name: 'index_profiles_on_user_id'
  end

  create_table 'recommendations', force: :cascade do |t|
    t.string 'message', null: false
    t.string 'signature', null: false
    t.string 'wallet_address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'wallet_address', null: false
    t.string 'jti', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['wallet_address'], name: 'index_users_on_wallet_address', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
end
