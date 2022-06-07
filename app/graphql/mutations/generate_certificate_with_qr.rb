# frozen_string_literal: true

module Mutations
  class GenerateCertificateWithQr < BaseMutation
    class GenerateCertificateWithQrAttributes < Types::BaseInputObject
      argument :qr_code_url, String, required: true, description: 'Send the open sea url'
      argument :certificate_id, String, required: true
    end

    argument :attributes, GenerateCertificateWithQrAttributes, required: true
    field :url, String, null: true

    def resolve(attributes:)
      { url: Certificates::QrCertificateGenerator.new(current_user: current_user, attributes: attributes.to_h).call }
    end
  end
end
