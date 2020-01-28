class CommentsController < ApplicationController
  def create
    @comment = Board.find(params[:board_id])

    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @board　
    else
      redirect_to @board　
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
