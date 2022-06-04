# frozen_string_literal: true

module Mutations
  class CreateCertificate < BaseMutation
    class GenerateCertificateAttributes < Types::BaseInputObject
      argument :institution_logo, Types::CustomTypes::FileType, required: true
      argument :institution_name, String, required: true
      argument :major, String, required: true
      argument :awarded_to, String, required: true
      argument :description, String, required: true
    end

    argument :attributes, GenerateCertificateAttributes, required: true
    type Types::CertificateType

    def resolve(attributes:)
      Certificate::Creator.new(current_user: current_user, attributes: attributes.to_h).call
    end
  end
end