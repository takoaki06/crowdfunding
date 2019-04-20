class Administer::CategoriesController < Administer::ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :verify_administer

  def index
    @categories = Category.all
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

    respond_to do |format|
      if @category.save
        format.html { redirect_to [:administer, @category], notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: [:administer, @category] }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to [:administer, @category], notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: [:administer, @category] }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
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
