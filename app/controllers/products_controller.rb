class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product), notice: 'Produto criado com sucesso.'
    else
      render 'new'
    end
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
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand, :description, :address, :quantity, :status, :value, :photo)
  end
end
