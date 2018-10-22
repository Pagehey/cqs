class Event < ApplicationRecord
  extend Enumerize

  has_many :participations, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  enumerize :category, in: ["Atelier", "Formation", "Événement"]

  validates :title, presence: { message: :blank}, uniqueness: { message: :exclusion}
  validates :description, presence: { message: :blank}
  validates :location, presence: { message: :blank}
  validates :price, presence: { message: :blank}
  validates :start_date, presence: { message: :blank}
  validates :end_date, presence: { message: :blank}
  validates :category, presence: { message: :blank}
  validates :number_of_places, presence: { message: :blank}
  validates :photo, presence: { message: :blank}
end
