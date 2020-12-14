class Request < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :user
  belongs_to :category
  validates_presence_of :description, :quantity, :status
  has_one_attached :photo
  STATUS = ['Rejeitado', 'Em analise', 'Aprovado']
  validates :status, inclusion: { in: STATUS }

  def available_products
    self.category.products.where(status: "Disponível")
  end

end
