# frozen_string_literal: true

module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :wallet_address, String, null: false
  end
end