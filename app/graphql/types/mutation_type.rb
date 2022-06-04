# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :send_for_kyc, mutation: Mutations::SendForKyc
    field :create_certificate, mutation: Mutations::CreateCertificate
  end
end
