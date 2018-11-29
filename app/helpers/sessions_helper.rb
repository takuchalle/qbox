# frozen_string_literal: true

module SessionsHelper
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def log_out
    session.delete(:admin_id)
    @logged_in_user = nil
  end

  def logged_in_user
    if (admin_id = session[:admin_id])
      @logged_in_user ||= Admin.find_by(id: admin_id)
    else
      @logged_in_user = nil
    end
  end

  def logged_in?
    !@logged_in_user.nil?
  end
end
