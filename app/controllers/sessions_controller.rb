class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def create
    user = User.find_or_create_by(name: auth_hash_name)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end
  
  protected
  
  def auth_hash_name
    name = request.env['omniauth.auth'][:info][:nickname]
  end
end