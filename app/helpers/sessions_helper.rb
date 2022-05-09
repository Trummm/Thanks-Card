module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user.present?
  end

  def forget(user)
    cookies.delete(:user_id)
  end
end
