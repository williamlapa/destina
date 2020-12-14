class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @products = Product.includes(:photo_attachment, :category).search_by_category_name_description_and_address(params[:query])
    elsif params[:request_id].present?
      @products = Request.find(params[:request_id]).available_products.includes(:photo_attachment, :category)
    else
      @products = Product.all.includes(:photo_attachment, :category)
    end
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product), notice: 'Produto criado com sucesso.'
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Produto atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def set_product
    @product = Product.includes(:photo_attachment, :category).find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category_id, :brand, :description, :address, :quantity, :status, :value, :photo)
  end
end
