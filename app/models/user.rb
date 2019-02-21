class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable

  acts_as_reader

  def self.reader_scope
    where(admin: true)
  end

  def is_admin?
    admin
  end
end
