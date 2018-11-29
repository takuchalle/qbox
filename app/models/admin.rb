# frozen_string_literal: true

class Admin < ApplicationRecord
  validates :name, presence: true, length: { maximum: 18 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
