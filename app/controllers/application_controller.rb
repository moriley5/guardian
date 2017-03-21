class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  helper_method :logged_in?

  def current_user
    @_current ||= User.find_by(id: session[:user_id]) if logged_in?
  end

  helper_method :current_user

  def authorize_to_view(user_id)
    if current_user.id != user_id
      redirect_to user_path(current_user)
    end
  end

  def redirect_home
    redirect_to root_path if !logged_in?
  end

  def index
    @user = User.new
  end

end
