class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(name: auth_hash_name)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end
  
  protected
  
  def auth_hash_name
    name = request.env['omniauth.auth'][:info][:name]
    name.gsub(' ', '').downcase
  end
end