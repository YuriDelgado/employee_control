class UsersController < ApplicationController
  before_action :admin_only
  
  def index
    @users = current_user.employees
  end

private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :warning => "Access denied."
    end
  end
end