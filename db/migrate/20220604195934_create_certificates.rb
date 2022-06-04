# frozen_string_literal: true

class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.string :institution_name
      t.string :major
      t.string :awarded_to
      t.string :description
      t.string :institution_logo_url
      t.references :user, null: false, type: :integer

      t.timestamps
    end
  end
end
