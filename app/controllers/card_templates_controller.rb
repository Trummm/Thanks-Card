class CardTemplatesController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def new
    @card_template = CardTemplate.new
    @card_templates = CardTemplate.all
  end

  def edit; end

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

  def update
    if @card_template.update(card_params)
      flash[:success] = 'Profile updated'
      redirect_to @card_template
    else
      render :edit
    end
  end

  def destroy
    if @card_template.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "Delete fail!"
    end
    redirect_to new_card_template_path
  end

  private 
  def find_card
    @card_template = CardTemplate.find(params[:id])
  end

  def card_params
    params.require(:card_template).permit(:name, :background, :top, :right, :bottom, :left)
  end
end
