class Event < ApplicationRecord
  has_many :participations

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
