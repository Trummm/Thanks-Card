class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]

  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash.now[:notice] = @like.errors.full_messages.to_sentence
    else
      flash.now[:success] = "Like Success!"
      redirect_to dashboard_path
    end
  end

  def destroy
    if @like.destroy
      flash.now[:success] = "Unlike Success!"
      redirect_to dashboard_path
    else
      flash.now[:notice] = @like.errors.full_messages.to_sentence
    end
  end

  private
  def find_like
    @like = current_user.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:thank_card_id)
  end
end
