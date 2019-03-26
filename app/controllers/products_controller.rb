class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @likes = Like.all
    @like = Like.new(user_id: current_user.id)
    if user_signed_in?
      @products = Product.where.not(user_id: current_user.id)
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @like = Like.new(user_id: current_user.id)
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
