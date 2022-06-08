# frozen_string_literal: true

class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.string :message, null: false

      t.timestamps
    end
  end
end
