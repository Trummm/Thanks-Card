class UsersController < ApplicationController
  before_action :find_user

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash.now[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless @user
  end
  
  def user_params
    params.require(:user).permit(:username, :name, :image, :password, :password_digest)
  end
end
