# frozen_string_literal: true

module Mutations
  class RegisterUser < BaseMutation
    argument :wallet_address, String, required: true
    field :user, Types::UserType, null: true

    def resolve(wallet_address:)
      User::Register.new(attributes: { wallet_address: wallet_address })
    end
  end
end
