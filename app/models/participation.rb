class Participation < ApplicationRecord
  belongs_to :event, dependent: :destroy

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # validates :phone_number,
  #           presence: { message: "Vous devez renseigner au moins un numéro de téléphone ou une adresse mail." },
  #           if: :contact_missing
  validates :phone_number,
            numericality: { message: "Veuillez respecter le format." },
            length: { is: 10, message: "Veuillez respecter le format."},
            if: :phone_number
  validates :email,
            presence: { message: "Vous devez renseigner au moins un numéro de téléphone ou une adresse mail." },
            if: :contact_missing
  validates :email,
            format: { with: valid_email_regex, message: "Adresse mail non valide." }

  def contact_missing
    email.nil? && phone_number.nil?
  end
end
