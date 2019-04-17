require 'test_helper'

class Administer::InvestmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administer_investments_index_url
    assert_response :success
  end

end
