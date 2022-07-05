class CommentsController < ApplicationController
  before_action :find_comment, only: %i[destroy update edit update]
  
  def edit; end

  def create 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referrer 
    else
      redirect_to :mew
    end
  end

  def destroy
    if @comment.destroy
      redirect_to dashboard_path
    end
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to dashboard_path
    end
  end

  private
  def find_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:comment, :thank_card_id, :image)
  end
end
