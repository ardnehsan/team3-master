require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get chart" do
    get :chart
    assert_response :success
  end

end
