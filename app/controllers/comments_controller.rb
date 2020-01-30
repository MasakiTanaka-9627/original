class CommentsController < ApplicationController
  before_action :comment_params, only: [:create]
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.board_id = params[:board_id]
    if @comment.save
      redirect_to("/boards/#{@comment.board_id}")
    else
      redirect_to("/boards/#{@comment.board_id}")
    end
  end

  def destroy
    @comment = Comment.find(params[:board_id])
    @comment.destroy
    redirect_to("/boards/#{params[:id]}")
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :content)
  end
end
