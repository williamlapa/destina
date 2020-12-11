class Request < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :category
  validates_presence_of :description, :quantity, :status, :legal_framework
  has_one_attached :photo
end
