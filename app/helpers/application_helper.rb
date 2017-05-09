module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user ? true : false
  end

  def login
    session[:user_id] = @user.id
  end

  def logout
    session.clear
  end

  def authorize
    redirect_to '/login' unless current_user
  end

end
