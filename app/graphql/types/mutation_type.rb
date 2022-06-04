# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :send_for_kyc, mutation: Mutations::SendForKyc
    field :generate_certificate, mutation: Mutations::GenerateCertificate
  end
end
