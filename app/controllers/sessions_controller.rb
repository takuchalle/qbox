class SessionsController < ApplicationController
  include AdminsHelper

  before_action :need_register?, only: %i[new create destroy]

  def new
  end

  def create
    @admin = Admin.first
    if @admin && @admin.authenticate(params[:session][:password])
      login @admin
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    logout
  end

  private

  def need_register?
    redirect_to admin_register_path unless admin_exist?
  end
end
