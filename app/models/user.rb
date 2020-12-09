class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests
  validates_presence_of :cpf, :first_name, :last_name, :cnpj, :address, :entity_type, :entity_name
end
