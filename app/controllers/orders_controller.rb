class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
  end

  def new
    @order = Order.new
  end

  def update
    @order.update(order_params)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
