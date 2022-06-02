# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :wallet_address, null: false
      t.string :jti, null: false

      t.timestamps
    end

    add_index :users, :wallet_address, unique: true
    add_index :users, :jti, unique: true
  end
end
