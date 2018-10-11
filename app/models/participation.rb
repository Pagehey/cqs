class Participation < ApplicationRecord
  belongs_to :event

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, presence: { message: 'Veuillez renseigner votre nom et prénom' }


  validates :email,
            presence: { message: "Vous devez renseigner au moins un numéro de téléphone ou une adresse mail" },
            if: :contact_missing
  validates :email,
            format: { with: valid_email_regex, message: "Adresse mail non valide" },
            unless: :email_missing
  validates :phone_number,
            length: { is: 10, message: "Ce numéro de téléphone n'est pas valide"},
            unless: :phone_number_missing

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
end
