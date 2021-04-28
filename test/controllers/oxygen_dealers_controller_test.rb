require "test_helper"

class OxygenDealersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oxygen_dealers_index_url
    assert_response :success
  end
end
