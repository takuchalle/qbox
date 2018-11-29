# frozen_string_literal: true

class SessionsController < ApplicationController
  include AdminsHelper

  before_action :need_register?, only: %i[new create destroy]

  def new; end

  def create
    @admin = Admin.first
    if @admin&.authenticate(params[:session][:password])
      log_in @admin
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def need_register?
    redirect_to admin_register_path unless admin_exist?
  end
end
