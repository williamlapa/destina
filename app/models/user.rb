class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests
  has_one_attached :photo
  validates :cpf, :first_name, :last_name, :cnpj, :address, :entity_type, :entity_name, presence: true
  validates :cpf, length: { is: 11 }
  validates :cnpj, length: { is: 14 }
end
