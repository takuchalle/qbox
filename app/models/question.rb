# frozen_string_literal: true

require 'securerandom'

class Question < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }

  before_create :generate_token

  private
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
