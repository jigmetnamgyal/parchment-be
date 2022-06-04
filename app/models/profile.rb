# frozen_string_literal: true

class Profile < ApplicationRecord
  validates(
    :first_name,
    :last_name,
    :document_url,
    :institution_name,
    :email_address,
    :institution_type,
    presence: true
  )

  belongs_to :user

  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum institution_type: { college: 0, school: 1 }
end
