# frozen_string_literal: true

class User < ApplicationRecord
  REGEX_PHONE_NUMBER = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/

  validates :phone_number, presence: true,
                           numericality: true,
                           length: { minimum: 10, maximum: 13 },
                           format: { with: REGEX_PHONE_NUMBER, message: 'Only digits' }
  validates :phone_number, :email, uniqueness: true
  validates :first_name, :last_name, allow_blank: true, length: { minimum: 3, maximum: 100 }
end
