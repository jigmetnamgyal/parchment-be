# frozen_string_literal: true

module Recommendations
  class Creator < BaseService
    attr_accessor :file

    def call
      Recommendation.create!(attributes)
    end
    # def valid_signer?
    #   uri = URI('https://cert-tainty.vercel.app/api/verify')
    #   http = Net::HTTP.new(uri.host, uri.port)
    #   http.use_ssl = true
    #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #
    #   request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    #   request.body = {
    #     "message": attributes[:message],
    #     "signature": attributes[:signature],
    #     "wallet_address": attributes[:wallet_address]
    #   }.to_json
    #
    #   JSON.parse(http.request(request).body)
    # end
  end
end
