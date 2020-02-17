class FavoriteCommentsController < ApplicationController
    protect_from_forgery :except => [:create, :destroy]

    def create
      comment_id = Comment.find(params[:id]).id
      favoritecomment = FavoriteComment.new(comment_id: comment_id, user_id: current_user.id)
      if favoritecomment.save
        flash[:success] = 'いいねしました。'
        redirect_back(fallback_location: root_path)
      end
    end
  
    def destroy
      favoritecomment = FavoriteComment.find_by(comment_id: params[:id], user_id: current_user)
      if favoritecomment.destroy
        flash[:success] = 'いいねを解除しました。'
        redirect_back(fallback_location: root_path)
      end
    end  
end
