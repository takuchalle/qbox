require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  def setup
    Admin.all.each(&:destroy)
  end

  test "should get new" do
    get admin_register_url
    assert_response :success
  end
end
