class Event < ApplicationRecord
  extend Enumerize

  to_param :slug

  has_many :participations, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  after_create :add_slug

  enumerize :category, in: %w[atelier formation evenement], scope: true

  validates :title, presence: { message: :blank}, uniqueness: { message: :exclusion}
  validates :description, presence: { message: :blank}
  validates :location, presence: { message: :blank}
  validates :price, presence: { message: :blank}
  validates :start_date, presence: { message: :blank}
  validates :end_date, presence: { message: :blank}
  validates :category, presence: { message: :blank}
  validates :number_of_places, presence: { message: :blank}
  validates :photo, presence: { message: :blank}

  scope :upcoming, -> { where('start_date > ?', Date.today).order(:start_date) }

  def add_slug
    update(slug: to_slug(title))
  end
end
