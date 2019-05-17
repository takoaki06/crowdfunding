class Admin::WatchingsController < Admin::ApplicationController
  before_action :authenticate_user!

  def index
    category_ids = current_user.categories.pluck(:id)
    @products = Product.includes(:categories).where(categories: {id: category_ids})
  end
end
