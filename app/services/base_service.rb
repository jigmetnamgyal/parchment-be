# frozen_string_literal: true

class BaseService
  include Assigner

  attr_accessor :params, :current_user, :id

  def initialize(attributes = {})
    assign_attributes(attributes)
  end
end
