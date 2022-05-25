class ThankCardsController < ApplicationController
  def index
    @thank_cards = ThankCard.all.paginate(page: params[:page], per_page: 3)
    @users = User.all
  end
  def new
    @thank_card = ThankCard.new
  end

  def create
    @thank_card = ThankCard.new(thank_card_params)
    @thank_card.user = current_user
    if @thank_card.save
      flash[:success] = 'Create Success!'
      redirect_to dashboard_path
    else
      render :new
    end
  end
  
  private
  def thank_card_params 
    params.require(:thank_card).permit(:user_id, :message, :card_template_id)
  end
end
