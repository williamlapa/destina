class Order < ApplicationRecord
  belongs_to :request
  belongs_to :product
  validates_presence_of :status
end
