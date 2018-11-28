require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_new_url
    assert_response :success
  end

end
