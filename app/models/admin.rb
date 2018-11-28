# frozen_string_literal: true

class Admin < ApplicationRecord
  validates :name, presence: true, length: { maximum: 18 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
