class InvestmentsController < ApplicationController
  before_action :check_owner, only: [:new, :create]

  def index
    @investments = current_user.investments.all
  end

  def new
    @investment = current_user.investments.new(product_id: params[:product_id])
  end

  def create
    @investment = current_user.investments.new(investment_params)
    @investment.product_id = params[:product_id]
    @investment.save
    redirect_to product_investments_path
  end


  private

    def check_owner
      product = Product.find(params[:product_id])
      if product.user_id == current_user.id
        return redirect_to product_investments_path, notice: '出資できないよ'
      end
    end

    def investment_params
      params.require(:investment).permit(:price)
    end
end
