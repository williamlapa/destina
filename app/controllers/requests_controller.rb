class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    if current_user.role == 'RFB'
      @requests = Request.all
    else
      @requests = Request.where(user_id: current_user)
    end
  end

  def show
    @user = current_user
    @products = @request.available_products
  end

  def new
    @request = Request.new
    @categories = Category.order("name ASC")
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.status = "Em analise"
    if @request.save
      redirect_to requests_path, notice: 'request was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @request.update(request_params)
      redirect_to @request, notice: 'request was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_url
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:description, :quantity, :status, :legal_framework, :category_id, :photo)
  end
end
