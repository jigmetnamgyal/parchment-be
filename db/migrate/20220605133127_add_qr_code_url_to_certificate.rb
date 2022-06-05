# frozen_string_literal: true

class AddQrCodeUrlToCertificate < ActiveRecord::Migration[7.0]
  def change
    add_column :certificates, :qr_code_url, :string
  end
end
