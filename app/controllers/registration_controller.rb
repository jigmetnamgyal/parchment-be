# frozen_string_literal: true

class RegistrationController < ApplicationController
  def create
    render json: User.create!(registration_params.merge!(jti: generate_token))
  end

  private

  def registration_params
    params.require(:user).permit(:wallet_address)
  end

  def generate_token
    GenerateJwtToken.encode({ wallet_address: registration_params['wallet_address'] })
  end
end
