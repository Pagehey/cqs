class Event < ApplicationRecord
  extend Enumerize

  has_many :participations, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  after_create :add_slug

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

  def add_slug
    update(slug: to_slug(title))
  end

  def to_param
    slug
  end
end
