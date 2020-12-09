class Product < ApplicationRecord
  has_many :orders
  belongs_to :category
  validates_presence_of :name, :brand, :description, :address, :quantity, :status, :value
end
