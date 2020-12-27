class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    if current_user.role == 'RFB'
      if params[:query].present?
        @requests = Request.includes(:category, :user).search_by_category_description_entity_name_and_cnpj(params[:query])
      else
        @requests = Request.all.includes(:category, :user).order("created_at DESC")
      end
    else
      if params[:query].present?
        @requests = Request.includes(:category, :user).search_by_category_description_entity_name_and_cnpj(params[:query]).where(user_id: current_user)
      else
        @requests = Request.includes(:category, :user).where(user_id: current_user)
      end
    end
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=requests.xlsx"
      end
      format.html { render :index }
    end
  end

  def show
    @user = @request.user
    @products = @request.available_products
  end

  def new
    @request = Request.new
    @categories = Category.order("name ASC")
  end

  def edit
    @categories = Category.order("name ASC")
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.status = "Em análise"
    if @request.save
      # mail = RequestMailer.with(request: @request).newrequest(@request)
      # mail.deliver_now
      redirect_to requests_path, notice: 'Requisição criada com sucesso!'
    else
      render 'new'
    end
  end

  def update
    if @request.update(request_params)
      redirect_to @request, notice: 'Requisição atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @request.order.present?
      @request.order.destroy
      @request.order.product.update_attributes(quantity: (@request.order.product.quantity + @request.quantity))
      @request.order.product.update_attributes(status: "Disponível") if @request.order.product.quantity.positive?
    end
    @request.destroy
    redirect_to requests_url
  end

  private

  def set_request
    @request = Request.includes(:category).find(params[:id])
  end

  def request_params
    params.require(:request).permit(:description, :quantity, :status, :legal_framework, :category_id, :photo)
  end
end
