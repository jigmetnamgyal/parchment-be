# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :send_for_kyc, mutation: Mutations::SendForKyc
    field :create_certificate, mutation: Mutations::CreateCertificate
    field :generate_certificate_pdf, mutation: Mutations::GenerateCertificatePdf
    field :update_kyc_status, mutation: Mutations::UpdateKycStatus
    field :generate_certificate_with_qr, mutation: Mutations::GenerateCertificateWithQr
    field :create_meta_data, mutation: Mutations::CreateMetaData
    field :create_recommendation_letter, mutation: Mutations::CreateRecommendationLetter
    field :download_letter, mutation: Mutations::DownloadLetter
  end
end
