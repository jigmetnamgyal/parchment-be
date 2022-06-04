# frozen_string_literal: true

module Users
  class Register < BaseService
    def call
      User.create!(wallet_address: attributes(:wallet_address), jti: generate_token)
    end

    private

    def generate_token
      JWT.encode(payload)
    end
  end
end
