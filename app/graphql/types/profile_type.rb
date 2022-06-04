# frozen_string_literal: true

module Types
  class ProfileType < BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :document_url, String, null: false
    field :institution_name, String, null: false
    field :email_address, String, null: false
    field :institution_type, Types::InstitutionEnum, null: false
    field :kyc_status, Types::KycStatusEnum, null: false
    field :user, Types::UserType, null: false
  end
end
