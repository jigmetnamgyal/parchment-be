# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :document_url, null: false, default: [], array: true
      t.string :institution_name, null: false, default: ''
      t.string :email_address, null: false, default: ''
      t.integer :institution_type, null: false
      t.integer :kyc_status, null: false, default: 0
      t.references :user, null: false, type: :integer

      t.timestamps
    end

    add_index :profiles, :document_url, using: 'gin'
  end
end
