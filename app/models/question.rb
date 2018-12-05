# frozen_string_literal: true

require 'securerandom'

class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
  before_create :generate_token

  has_one_attached :img

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
