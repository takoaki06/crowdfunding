class Administer::InvestmentsController < Administer::ApplicationController
  before_action :login_administer

  def index
    @investments = Investment.all
  end

  private
    def login_administer
      unless current_user.administer? 
        return redirect_to root_path
      end
    end
end
