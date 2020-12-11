class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  def index
    @requests = Request.all
    # @requests = policy_scope(Request)
  end

  def show
  end

  def new
    @request = Request.new
    # @category = Category.new
    @categories = Category.order("name ASC")
    # authorize @request
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.status = "pendente"
    # @request.category = Category.find(params[:category])
    # authorize @request

    if @request.save
      redirect_to request_path(@request), notice: 'request was successfully created.'
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
    # authorize @request
  end

  def request_params
    params.require(:request).permit(:description, :quantity, :status, :legal_framework, :category_id, :photo)
  end
end
