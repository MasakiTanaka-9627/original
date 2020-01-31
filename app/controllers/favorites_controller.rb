class FavoritesController < ApplicationController
  def create
    @user_id = current_user.id
    @board_id = Board.find(params[:id]).id
    @favorite = Favorite.new(board_id: @board_id, user_id: @user_id)

    if @favorite.save
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to user_path(current_user)
    end
  end
end
