# frozen_string_literal: true

class CreateMetaData < ActiveRecord::Migration[7.0]
  def change
    create_table :meta_data do |t|
      t.string :image_url, null: false
      t.string :description, null: false
      t.string :name, null: false
      t.jsonb :traits, array: true, default: []
      t.references :user, null: false, type: :integer

      t.timestamps
    end
  end
end
