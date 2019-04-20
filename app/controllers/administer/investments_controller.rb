class Administer::InvestmentsController < Administer::ApplicationController
  before_action :verify_administer

  def index
    @investments = Investment.all
  end

  private
    def verify_administer
      unless current_user.administer? 
        return redirect_to root_path
      end
    end
end
