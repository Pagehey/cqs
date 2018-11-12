class Participation < ApplicationRecord
  belongs_to :event

  after_validation :format_phone_number

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  valid_phone_regex = /\A0\d(?:\d{8}|(?: \d\d){4}|(?:-\d\d){4})\z/

  validates :first_name, presence: { message: 'Veuillez renseigner votre prénom' }
  validates :last_name, presence: { message: 'Veuillez renseigner votre nom' }
  validates :number_of_places_wanted, presence: { message: 'Veuillez renseigner le nombre de place(s) souhaitée(s)'}

  validates :email,
            presence: { message: "Vous devez renseigner au moins un numéro de téléphone ou une adresse mail" },
            if: :contact_missing
  validates :email,
            format: { with: valid_email_regex, message: "Adresse mail non valide" },
            unless: :email_missing
  validates :phone_number,
            format: { with: valid_phone_regex, message: "Ce numéro de téléphone n'est pas valide"},
            unless: :phone_number_missing

  acts_as_readable on: :created_at

  private

  def contact_missing
    email.empty? && phone_number.empty?
  end

  def phone_number_missing
    phone_number.empty?
  end

  def email_missing
    email.empty?
  end

  def format_phone_number
    self.phone_number = phone_number.gsub(/-|\s/, '').scan(/../).join(' ')
  end
end
