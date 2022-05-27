class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(thank_card_id: params[:thank_card_id], user_id: current_user.id)
    @thank_card_id = params[:thank_card_id]
    existing_like = Like.where(thank_card_id: params[:thank_card_id], user_id: current_user.id)

    respond_to do |format|
      format.js{
        if existing_like.any?
          existing_like.first.destroy
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end
         
        @thank_card_likes = ThankCard.find(@thank_card_id).total_likes_count
        render "thank_cards/like"
      }
    end
  end
end
