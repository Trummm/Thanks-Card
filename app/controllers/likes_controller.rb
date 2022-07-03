class LikesController < ApplicationController
  before_action :find_thank_card, only: %i[create]

  def create
    @like = current_user.likes.find_or_initialize_by(thank_card_id: @thank_card.id)

    respond_to do |format|
      format.js{
        if @like.new_record?
          @like.save
          @success = true
        else
          @like.destroy
          @success = false
        end
                 
        render "thank_cards/like.js.erb"
      }
    end
  end

  private 
  def find_thank_card
    @thank_card = ThankCard.find(params[:thank_card_id])
  end
end
