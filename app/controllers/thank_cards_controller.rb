class ThankCardsController < ApplicationController
  def index
    @thank_cards = ThankCard.all.paginate(page: params[:page], per_page: 3)
    @users = User.all.paginate(page: params[:page], per_page: 3)
  end

  def new
    @thank_card = ThankCard.new
  end

  def create
    @thank_card = current_user.thank_cards.new(thank_card_params)
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
