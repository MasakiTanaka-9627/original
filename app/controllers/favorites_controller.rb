class FavoritesController < ApplicationController
  protect_from_forgery :except => [:create, :destroy]

  def create
    board_id = Board.find(params[:id]).id
    favorite = Favorite.new(board_id: board_id, user_id: current_user.id)
    if favorite.save
      flash[:success] = 'いいねしました。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    favorite = Favorite.find_by(board_id: params[:id], user_id: current_user)
    if favorite.destroy
      flash[:success] = 'いいねを解除しました。'
      redirect_back(fallback_location: root_path)
    end
  end
end
