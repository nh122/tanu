require 'test_helper'

class TanusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
