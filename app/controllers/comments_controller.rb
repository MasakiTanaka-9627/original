class CommentsController < ApplicationController
  before_action :comment_params, only: [:create]
  
  def create
    comment = Comment.new( content: comment_params[:content], 
                            user_id: current_user.id, 
                            board_id: params[:board_id])
    if comment.save
      flash[:success] = 'コメントの投稿に成功しました'
      redirect_to board_path(comment.board_id)
    else
      flash[:danger] = 'コメントの投稿に失敗しました。'
      redirect_to board_path(comment.board_id), flash: { error: comment.errors.full_messages }
    end
  end

  def destroy
    comment = Comment.find(params[:board_id])
    comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content)
  end
end
