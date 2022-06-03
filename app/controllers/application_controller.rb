# frozen_string_literal: true

class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end
end
