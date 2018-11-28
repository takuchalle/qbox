# coding: utf-8
require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin = Admin.new(name: "hoge", password: "hogehoge", password_confirmation: "hogehoge")
  end

  test 'should be valid' do
    assert @admin.valid?
  end

  test 'should be valid when name is japanese' do
    @admin.name = "ほげ"
    assert @admin.valid?
  end

  test 'should not be valid when password is not match' do
    @admin.password_confirmation = "fugafuga"
    assert_not @admin.valid?
  end

  test 'should not be valid when password is short' do
    @admin.password = "hoge"
    @admin.password_confirmation = "hoge"
    assert_not @admin.valid?
  end

  test 'should not be valid when name is long' do
    @admin.name = "a" * 100
    assert_not @admin.valid?
  end
end
