# frozen_string_literal: true

module Types
  class CertificateType < BaseObject
    field :id, ID, null: false
    field :institution_name, String, null: false
    field :major, String, null: false
    field :awarded_to, String, null: false
    field :description, String, null: false
    field :institution_logo_url, String, null: false
    field :user, Types::UserType, null: false
  end
end
