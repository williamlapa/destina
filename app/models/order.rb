class Order < ApplicationRecord
  belongs_to :request
  belongs_to :product
  belongs_to :user
  validates_presence_of :status
  STATUS = ['Reservado', 'Aceito', 'Entregue']
  validates :status, inclusion: { in: STATUS }
end
