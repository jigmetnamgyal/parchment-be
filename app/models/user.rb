# frozen_string_literal: true

class User < ApplicationRecord
  validates :wallet_address, presence: true

  has_one :profile, dependent: :destroy

  has_many :certificates, dependent: :destroy
end
