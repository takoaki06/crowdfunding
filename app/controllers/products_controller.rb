class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  PER = 10

  # GET /products
  # GET /products.json
  def index
    if user_signed_in?
      @products = Product.includes(:user).where.not(user_id: current_user.id).page(params[:page]).per(PER)
    else
      @products = Product.all.includes(:user).page(params[:page]).per(PER)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :desc, :user_id)
    end
end
