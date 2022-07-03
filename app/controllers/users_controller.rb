class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :logged_in_user
  before_action :load_notification, only: %i[index destroy show edit update new]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(page: params[:page], per_page: 6)
    @thank_card = ThankCard.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_new)
    @user.skip_validations_create = true
    if @user.save
      flash.now[:success] = "Create Success!"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @thank_card_by_user = @user.thank_cards
    @thank_cards = ThankCard.all
    @thank_cards_approved = @user.thank_cards.where("approved = true")
    @thank_cards_not_approved = ThankCard.where("approved = false")
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    @user.skip_validations_update = true
    if @user.update(user_params_update)
      flash.now[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash.now[:success] = "User deleted"
    else
      flash.now[:danger] = "Delete fail!"
    end
    redirect_to request.referrer 
  end

  private
  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless @user
  end
  
  def user_params_update
    params.require(:user).permit(:username, :image, :password, :password_digest, :birthday, :gender, :phone)
  end

  def user_params_new
    params.require(:user).permit(:name, :email, :password, :password_digest, :admin, :active, :checkbox_value)
  end

  def load_notification
    @activities = PublicActivity::Activity.order('created_at DESC').limit(10)
  end
end
