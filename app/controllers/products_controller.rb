class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_like, only: [:index]

  # GET /products
  # GET /products.json
  def index
    if user_signed_in?
      @products = Product.where.not(user_id: current_user.id)
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @like = Like.new
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_like
      @likes = Like.all
      @like = Like.new
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :desc, :user_id)
    end
end
