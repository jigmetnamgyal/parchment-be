# frozen_string_literal: true

module Mutations
  class GenerateCertificate < BaseMutation
    class GenerateCertificateAttributes < Types::BaseInputObject
      argument :institution_logo, Types::CustomTypes::FileType, required: true
      argument :institution_name, String, required: true
      argument :major, String, required: true
      argument :awarded_to, String, required: true
      argument :description, String, required: true
    end

    argument :attributes, GenerateCertificateAttributes, required: true
    type Types::ProfileType

    def resolve(attributes:)
      current_user.create_profile(attributes.to_h)
    end
  end
end
