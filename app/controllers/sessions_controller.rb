class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
      if user&.authenticate(params[:session][:password])
        if user.active
          log_in(user)
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          flash.now[:success] = "Login Success!"
          redirect_to dashboard_path
        else
          flash[:danger] = "your account has not been verified !"
          redirect_to root_path
        end
      else
        flash.now[:danger] = "Invalid email/password combination"
        render :new
      end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Logout Success!!"
    redirect_to login_path
  end
end
