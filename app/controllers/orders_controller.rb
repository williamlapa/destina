class OrdersController < ApplicationController
  before_action :set_request_product

  def create
    @order = Order.new(order_params)
    @order.request = @request
    @order.product = @product
    if @order.save
      render order_path(@order)
    else
      render :new
    end
  end

  def new
    @order = Order.new
  end

  def update
    @order.update(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:request_id, :product_id, :status)
  end

  def set_request_product
    @request = Request.find(params[:request_id])
    @product = Product.find(params[:product_id])
  end
end
