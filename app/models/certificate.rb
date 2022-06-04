# frozen_string_literal: true

class Certificate < ApplicationRecord
  belongs_to :user

  has_one_attached :institution_logo
  has_one_attached :certificate_pdf_download
end
