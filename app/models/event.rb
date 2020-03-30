# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { maximum: 350 }
  validates :location, presence: true
  validates :organizer_email, allow_blank: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :user, presence: true
end
