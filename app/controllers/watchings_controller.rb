class WatchingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @watchings = current_user.categories.order(created_at: :desc)
  end
end
