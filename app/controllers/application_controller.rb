class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # заглушка для эмуляции авторизованности
  def current_user
    @current_user ||= if session[:user_id]
      User.find_by_id(session[:user_id])
    end
  end
  helper_method :current_user

  def login(user)
    @current_user = user
    session[:user_id] = user ? user.id : nil
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  # filters
  def require_auth
    unless current_user
      redirect_to users_path, :alert => 'Auth required'
    end
  end

end
