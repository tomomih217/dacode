class ApplicationController < ActionController::Base
  protect_from_forgery
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  before_action :logout_guest

  private

  def not_authenticated
    redirect_to login_path, warning: 'Please login!'
  end

  def logout_guest
    return if current_user.nil?
    return unless current_user.guest?
    guest_user_id = current_user.id
    logout
    User.destroy(guest_user_id)
  end
end
