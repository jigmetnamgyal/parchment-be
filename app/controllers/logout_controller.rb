# frozen_string_literal: true

class LogoutController < ApplicationController
  def destroy
    User.find(logout_params['id']).update!(jti: SecureRandom.hex(18))
    render json: { status: true }
  end

  private

  def logout_params
    params.require(:user).permit(:id)
  end
end
