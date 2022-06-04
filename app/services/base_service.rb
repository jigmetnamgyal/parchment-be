# frozen_string_literal: true

class BaseService
  include Assigner
  include Rails.application.routes.url_helpers

  attr_accessor :attributes, :current_user, :id

  def initialize(attributes = {})
    assign_attributes(attributes)
  end
end
