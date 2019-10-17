class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_mailer_host, :authenticate_user!

  add_flash_types :danger, :info, :warning, :success

protected
  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
       devise_parameter_sanitizer.permit(:accept_invitation) { |u| u.permit(:name, :password, :confirm_password, :invitation_token)}
       devise_parameter_sanitizer.permit(:invite) { |u| u.permit(:email, :admin_id)}
  end

  def set_mailer_host
    ActionMailer::Base.default_url_options[:host] = "lvh.me:3000"
  end

  def after_invite_path_for resource
    users_path
  end
end
