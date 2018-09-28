class Event < ApplicationRecord
  has_many :participations

  mount_uploader :photo, PhotoUploader

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true
end
