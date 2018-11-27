# frozen_string_literal: true

require 'securerandom'

class Question < ApplicationRecord
  before_create :generate_token

  private
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
