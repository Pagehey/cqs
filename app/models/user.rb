class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  acts_as_reader

  def self.reader_scope
    where(admin: true)
  end

  def admin?
    admin
  end
end
