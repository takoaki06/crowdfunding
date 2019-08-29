class Administer::CategoriesController < Administer::ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :verify_administer
  PER = 10

  def index
    @categories = Category.page(params[:page]).per(PER)
  end


  def show
  end


  def new
    @category = Category.new
  end


  def edit
  end


  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to administer_categories_path
  end



  def update
    @category.update(category_params)
    redirect_to administer_categories_path
  end



  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to administer_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end


    def category_params
      params.require(:category).permit(:name)
    end

    def verify_administer
      unless current_user.administer? 
        return redirect_to root_path
      end
    end
end
