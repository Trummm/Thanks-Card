class ThankCardsController < ApplicationController
  before_action :find_thank_card, only: %i[show destroy edit update approved approved_destroy]
  before_action :load_notification, only: %i[index destroy show edit update new approved_index]

  def index
    @q = ThankCard.ransack(params[:q])
    @q.sorts = ['created_at desc'] if @q.sorts.empty?
    @thank_cards = @q.result.includes(:user).where("approved = true").paginate(page: params[:page], per_page: 4)
    @users = User.where("admin = false").and(User.where("id != #{current_user.id}")).limit(5)
    @users_story = User.where("admin = false").and(User.where("id != #{current_user.id}"))
    @comments = Comment.all
    @comment = Comment.new
    @thank_card = ThankCard.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new; end

  def create
    @thank_card = current_user.thank_cards.new(thank_card_params)
    if @thank_card.save
      flash[:success] = 'Create Success!'
      redirect_to request.referrer 
    else
      render :new
    end
  end
  
  def edit; end

  def show
    @comments = Comment.all
    @comment = Comment.new
  end


  def destroy
    if @thank_card.destroy
      flash.now[:success] = "Delete Success!"
      redirect_to dashboard_path
    end
  end

  def update
    if @thank_card.update(thank_card_params)
      redirect_to @thank_card
    end
  end

  def approved_index
    @thank_cards = ThankCard.where("approved = false").paginate(page: params[:page], per_page: 2)
  end

  def approved 
    @thank_card.update_attribute(:approved, true)
    @thank_card.update_attribute(:created_at, Time.zone.now)
    flash.now[:success] = 'Approved Success!'
    redirect_to dashboard_path
  end

  def approved_destroy
    if @thank_card.destroy
      flash.now[:success] = "Delete Success!"
      redirect_to request.referrer  
    end
  end
  
  private
  def find_thank_card
    @thank_card = ThankCard.find(params[:id])
  end

  def thank_card_params 
    params.require(:thank_card).permit(:user_id, :user_take_thank_card_id, :message, :card_template_id)
  end

  def load_notification
    @activities = PublicActivity::Activity.order('created_at DESC').limit(10)
  end
end
