class Order < ApplicationRecord
  belongs_to :request
  belongs_to :product
  belongs_to :user
  validates_presence_of :status
  STATUS = ['Reservada', 'Aguarda Documentos', 'Aceita', 'Entregue']
  validates :status, inclusion: { in: STATUS }
end
