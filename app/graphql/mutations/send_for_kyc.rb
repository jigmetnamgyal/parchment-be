# frozen_string_literal: true

module Mutations
  class SendForKyc < BaseMutation
    class SendForKycAttributes < Types::BaseInputObject
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :document_url, String, required: true
      argument :institution_name, String, required: true
      argument :email_address, String, required: true
      argument :institution_type, String, required: true
    end

    argument :attributes, SendForKycAttributes, required: true
    field :profile, Types::ProfileType, null: true

    def resolve(attributes:)
      current_user.create_profile(attributes)
    end
  end
end
