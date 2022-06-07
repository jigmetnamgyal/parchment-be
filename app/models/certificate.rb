# frozen_string_literal: true

class Certificate < ApplicationRecord
  belongs_to :user

  has_one_attached :certificate_pdf_download
  has_one_attached :certificate_with_qr_download
  has_one_attached :certificate_png
  has_one_attached :opensea_qr
end
