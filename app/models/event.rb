# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy

  validates :title, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { maximum: 350 }
  validates :location, presence: true
  validates :organizer_email, allow_blank: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :user, presence: true

  default_scope { order(created_at: :desc) }
  scope :by_status, ->(status) { where(status: status) }

  def self.tagged_with(name)
    Tag.find_by!(name: name).events
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
