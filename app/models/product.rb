class Product < ApplicationRecord
  has_many :orders
  belongs_to :category
  has_one_attached :photo
  validates_presence_of :name, :brand, :description, :address, :quantity, :status, :value

  include PgSearch::Model

  pg_search_scope :search_by_category_name_description_and_address,
                  against: %i[name description address],
                  associated_against: {
                    category: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end