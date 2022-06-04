# frozen_string_literal: true

require 'net/http'

class LoginController < ApplicationController
  def login
    @user = User.find_by(wallet_address: login_params['wallet_address'])

    if @user.present? && valid_wallet_address
      token = GenerateJwtToken.encode(wallet_address: login_params['wallet_address'])
      @user.update!(jti: token)
      render json: { jwt_token: token, user: @user }
    else
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end

  private

  def valid_wallet_address
    uri = URI('https://cert-tainty.vercel.app/api/verify')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body = {
      "message": login_params['message'],
      "signature": login_params['signature'],
      "wallet_address": login_params['wallet_address']
    }.to_json

    JSON.parse(http.request(request).body)
  end

  def login_params
    params.require(:user).permit(:wallet_address, :signature, :message)
  end
end
