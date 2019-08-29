class LikesController < ApplicationController
  before_action :check_owner, only: [:create, :destroy]

  def create
    @like = current_user.likes.new(product_id: params[:product_id])
    @like.save
    UserMailer.send_message_to_user(@like).deliver_now
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = current_user.likes.find_by(product_id: params[:product_id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def check_owner
    product = Product.find(params[:product_id])
    if product.user_id == current_user.id
      return redirect_to product_investments_path, notice: 'いいねできません'
    end
  end

end
