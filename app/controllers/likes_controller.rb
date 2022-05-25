class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash.now[:notice] = @like.errors.full_messages.to_sentence
    end
      redirect_to dashboard_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    thank_card = @like.thank_card
    @like.destroy
    redirect_to dashboard_path
  end

  private
  def like_params
    params.require(:like).permit(:thank_card_id)
  end
end
