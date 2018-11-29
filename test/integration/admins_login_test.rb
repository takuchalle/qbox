require 'test_helper'

class AdminsLoginTest < ActionDispatch::IntegrationTest
  test "login without register" do
    clear_admin
    get admin_login_path
    assert_redirected_to admin_register_path
  end

  test "login after register" do
    get admin_login_path
    assert_template 'sessions/new'
    post admin_login_path, params: { session: { password: "password" } }
    assert_redirected_to root_path
  end

  test "login after register invalid parameters" do
    get admin_login_path
    assert_template 'sessions/new'
    post admin_login_path, params: { session: { password: "" } }
    assert_template 'sessions/new'
  end
end
