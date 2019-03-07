class Admin::ProductsController < Admin::ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  
  
  # admin
  def index
    @products = current_user.products
  end


  def show
  end


  def new
    @product = Product.new
  end

  def edit
  end


  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @product] }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [:admin, @product], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @product] }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :desc, :user_id)
    end

  
end