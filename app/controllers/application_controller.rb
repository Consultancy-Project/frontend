class ApplicationController < ActionController::Base
    before_action :require_login, except: [:current_user]

  def require_login
    raise ActionController::RoutingError.new('Not Found') if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
