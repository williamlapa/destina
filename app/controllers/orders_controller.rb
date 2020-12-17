class OrdersController < ApplicationController
  before_action :set_request_product, except: %i[index edit update destroy accept reject]
  before_action :set_order, only: %i[show edit update destroy accept reject]

  def index
    @orders = Order.all.includes(:request, :user, request: :user)
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.request = @request
    @order.product = @product
    @order.user_id = current_user.id
    if @order.save
      redirect_to orders_path, notice: 'Ordem criada com sucesso.'
    else
      render :new
    end
    @request.update_attributes(status: "Aprovada")
    @product.update_attributes(quantity: (@product.quantity - @request.quantity))
    if @product.quantity < 1
      @product.update_attributes(status: "Esgotado")
    end
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: 'Ordem atualizada com sucesso.'
    else
      render :edit
    end
  end

  def accept
    @order.update(status: "Aceita")
    redirect_to requests_path, notice: 'Mercadoria aceita com sucesso.'
    @order.request.update_attributes(status: "A retirar")
  end

  def reject
    @order.update(status: "Não aceita")
    redirect_to requests_path, notice: 'Mercadoria rejeitada com sucesso.'
    @order.request.update_attributes(status: "Encerrada")
    @order.product.update_attributes(quantity: (@order.product.quantity + @order.request.quantity))
    if @order.product.quantity.positive?
      @order.product.update_attributes(status: "Disponível")
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
    if @order.request.status == "Aprovada"
      @order.request.update_attributes(status: "Em análise")
    end
    @order.product.update_attributes(quantity: (@order.product.quantity + @order.request.quantity))
    if @order.product.quantity.positive?
      @order.product.update_attributes(status: "Disponível")
    end
  end

  private

  def order_params
    params.require(:order).permit(:request_id, :product_id, :status, :user_id)
  end

  def set_request_product
    @request = Request.find(params[:request_id])
    @product = Product.find(params[:product_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
