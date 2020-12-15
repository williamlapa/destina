class Request < ApplicationRecord
  has_one :order, dependent: :destroy
  has_one :product, through: :order
  belongs_to :user
  belongs_to :category
  validates_presence_of :description, :quantity, :status
  has_one_attached :photo
  STATUS = ['Rejeitado', 'Em analise', 'Aprovado', 'A retirar']
  validates :status, inclusion: { in: STATUS }

  def available_products
    self.category.products.where(status: "Disponível")
  end

  include PgSearch::Model

  pg_search_scope :search_by_category_description_entity_name_and_cnpj,
                  against: %i[description],
                  associated_against: {
                    category: [:name],
                    user: [:entity_name, :cnpj]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
