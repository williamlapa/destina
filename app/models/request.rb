class Request < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :category
  validates_presence_of :description, :quantity, :status
  has_one_attached :photo
  STATUS = ['Rejeitado', 'Em analise', 'Aprovado']
  validates :status, inclusion: { in: STATUS }
end
