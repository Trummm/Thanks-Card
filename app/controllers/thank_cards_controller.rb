class ThankCardsController < ApplicationController
  def new
    @thank_card = ThankCard.includes(:user, :card_template)
  end

  def create
    @thank_card = ThankCard.new(thank_card_params)
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
