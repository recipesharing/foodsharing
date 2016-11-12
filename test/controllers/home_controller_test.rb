require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get indext" do
    get home_indext_url
    assert_response :success
  end

end
