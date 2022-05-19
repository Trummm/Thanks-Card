class CardTemplatesController < ApplicationController
  def new; end

  def create 
    @card = CardTemplate.new(card_params)
    @card.image_url.attach(params[:image_url])
    if @card.save
      flash.now[:success] = 'Create Success!'
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private 
  def card_params
    params.require(:card_templates).permit(:name, :image_url, :top, :right, :bottom, :left)
  end
end
