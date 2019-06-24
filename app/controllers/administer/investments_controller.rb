class Administer::InvestmentsController < Administer::ApplicationController
  before_action :verify_administer
  PER = 10

  def index
    @investments = Investment.includes({product: :user}).page(params[:page]).per(PER)
  end

  private
    def verify_administer
      unless current_user.administer? 
        return redirect_to root_path
      end
    end
end
