# frozen_string_literal: true

module AdminsHelper
  def admin_user
    Admin.first
  end

  def admin_exist?
    !admin_user.nil?
  end
end
