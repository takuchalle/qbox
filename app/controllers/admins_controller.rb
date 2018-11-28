# frozen_string_literal: true

class AdminsController < ApplicationController
  include AdminsHelper

  before_action :only_one_admin, only: %i[new create]

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_param)
    if @admin.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def only_one_admin
    redirect_to admin_login_path if admin_exist?
  end

  def admin_param
    params.require(:admin).permit(:name, :password, :password_confirmation)
  end
end
