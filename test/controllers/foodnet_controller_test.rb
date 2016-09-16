require 'test_helper'

class FoodnetControllerTest < ActionController::TestCase
  test "should get net" do
    get :net
    assert_response :success
  end

end
