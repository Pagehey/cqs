class Event < ApplicationRecord
  extend Enumerize

  to_param :slug

  has_many :participations, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  after_create :add_slug

  enumerize :category, in: %w[atelier formation evenement], scope: true

  validates :title, presence: { message: :blank }
  validates :description, presence: { message: :blank }
  validates :location, presence: { message: :blank }
  validates :price, presence: { message: :blank }
  validates :start_date, presence: { message: :blank }
  validates :end_date, presence: { message: :blank }
  validates :category, presence: { message: :blank }
  validates :photo, presence: { message: :blank }

  scope :upcoming, -> { where('start_date > ?', Date.today).where(out_of_places: false).order(:start_date) }

  def add_slug
    update(slug: to_slug(title))
  end
end
