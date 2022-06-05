# frozen_string_literal: true

class AddYearAwardedInCertificate < ActiveRecord::Migration[7.0]
  def change
    add_column :certificates, :year_awarded, :datetime, null: false
  end
end
