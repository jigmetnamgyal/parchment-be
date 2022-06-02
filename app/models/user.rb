# frozen_string_literal: true

class User < ApplicationRecord
  validates :wallet_address, presence: true
end
