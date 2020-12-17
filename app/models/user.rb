class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests
  has_one_attached :photo
  validates :cpf, :first_name, :last_name, :cnpj, :address, :entity_type, :entity_name, presence: true
  validates :cpf, length: { in: 11..14 }
  validates :cnpj, length: { in: 14..18 }

  # rotina para gerar email apos criacao de novo usuario
  # after_create :send_welcome_email

  # private

  # def send_welcome_email
  #   UserMailer.with(user: self).welcome.deliver_now
  # end
end
