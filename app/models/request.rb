class Request < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :category
  validates_presence_of :description, :quantity, :status, :legal_framework
  has_one_attached :photo

  def available_products
    self.category.products.where(status: "Disponível")
  end
end
