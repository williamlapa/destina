class ProductsImportsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=products.xlsx"
      end
      format.html { render :index }
    end
  end

  def new
    @categories = Category.all
    @products_import = ProductsImport.new
  end

  def create
    @products_import = ProductsImport.new(params[:products_import])
    if @products_import.save
      redirect_to products_path
    else
      render :new
    end
  end
  
  def modelo
    respond_to do |format|
      format.xlsx do
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=modelo.xlsx"
      end
      format.html { render :modelo }
    end
  end
end
