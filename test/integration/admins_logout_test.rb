require 'test_helper'

class AdminsLogoutTest < ActionDispatch::IntegrationTest
  test "logout" do
    get root_path
    delete admin_logout_path
    assert_redirected_to root_path
  end

  test "multiple logout" do
    get root_path
    delete admin_logout_path
    assert_redirected_to root_path
    delete admin_logout_path
    assert_redirected_to root_path
  end
end
