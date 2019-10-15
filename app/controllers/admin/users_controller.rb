class Admin::UsersController < ApplicationController
  before_action :admin_only
  
  def index
    @users = User.where(admin: false)
  end

private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :warning => "Access denied."
    end
  end
end