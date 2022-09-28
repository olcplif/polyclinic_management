# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email.downcase! }

  VALID_PHONE_NUMBER_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :phone_number, presence: true,
                           numericality: true,
                           uniqueness: { case_sensitive: false },
                           length: { minimum: 10, maximum: 13 },
                           format: { with: VALID_PHONE_NUMBER_REGEX }

  validates :email, allow_blank: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    # format: Devise.email_regexp,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :first_name, :last_name, allow_blank: true, length: { minimum: 3, maximum: 100 }
end
