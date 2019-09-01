class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_owner, only: [:new, :create]
  before_action :limit_of_amount, only: [:new, :create]
  before_action :not_exceed_price, only: [:create]
  PER = 10

  def index
    @investments = current_user.investments.includes(product: :user).page(params[:page]).per(PER)
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
      if product.owner?(current_user)
        return redirect_to product_investments_path, notice: '出資できないよ'
      end
    end

    #出資額の合計を出し、出資に制限をかける
    def limit_of_amount
      product = Product.find(params[:product_id])
      unless Investment.investable?(product)
        return redirect_to product_investments_path, notice: '目標金額に達したため出資できません！'
      end
    end

    #出資金額が希望額を超えないようにする
    def not_exceed_price
      product = Product.find(params[:product_id])
      investment = product.investments.new(investment_params)
      unless investment.exceed?
        return redirect_to product_investments_path, notice: '目標金額以上の出資はできません！'
      end
    end


    def investment_params
      params.require(:investment).permit(:price)
    end
end
