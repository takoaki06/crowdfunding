class Admin::WatchingsController < Admin::ApplicationController
  before_action :authenticate_user!
  PER = 10

  def index
    category_ids = current_user.categories.pluck(:id)
    @products = Product.includes(:categories).where(categories: {id: category_ids}).page(params[:page]).per(PER)
  end
end
