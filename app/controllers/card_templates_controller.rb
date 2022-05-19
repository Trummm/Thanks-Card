class CardTemplatesController < ApplicationController
  def new; end

  def create 
    @card = CardTemplate.new(card_params)
    @card.image.attach(params[:image])
    if @card.save
      flash.now[:success] = 'Create Success!'
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private 
  def card_params
    params.require(:card_template).permit(:name, :image, :top, :right, :bottom, :left)
  end
end
