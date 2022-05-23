class CardTemplatesController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def new
    @card_template = CardTemplate.new
    @card_templates = CardTemplate.all
  end

  def show; end

  def create 
    @card = CardTemplate.new(card_params)
    if @card.save
      flash.now[:success] = 'Create Success!'
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private 
  def find_card
    @card_template = CardTemplate.find_by(id: params[:id]) or not_found
  end

  def card_params
    params.require(:card_template).permit(:name, :background, :top, :right, :bottom, :left)
  end
end
