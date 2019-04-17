class Administer::InvestmentsController < Administer::ApplicationController
  def index
    if current_user.administer? 
      @investments = Investment.all
    else
      redirect_to root_path
    end
  end
end
