# frozen_string_literal: true

module Mutations
  class GenerateCertificateWithQr < BaseMutation
    class GenerateCertificateWithQrAttributes < Types::BaseInputObject
      argument :qr_code_url, String, required: true
      argument :certificate_id, String, required: true
    end

    argument :attributes, GenerateCertificateWithQrAttributes, required: true
    field :url, String, null: true

    def resolve(attributes:)
      Certificate.find(attributes.to_h['certificate_id']).update!(qr_code_url: attributes.to_h['qr_code_url'])
      { url: Certificates::QrCertificateGenerator.new(current_user: current_user, attributes: attributes.to_h).call }
    end
  end
end
