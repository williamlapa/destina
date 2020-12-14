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

  include PgSearch::Model

  pg_search_scope :search_by_category_description_entity_name_and_cnpj,
                  against: %i[entity_name cnpj description],
                  associated_against: {
                    category: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
