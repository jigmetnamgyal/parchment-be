# frozen_string_literal: true

module Mutations
  class GenerateCertificatePdf < BaseMutation
    argument :certificate_id, ID, required: true
    field :url, String, null: true

    def resolve(certificate_id:)
      { url: Certificates::PdfGenerator.new(current_user: current_user, certificate_id: certificate_id).call }
    end
  end
end
