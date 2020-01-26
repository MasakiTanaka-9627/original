class BoardsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
#    if params[:keyword].blank?
#      @boards = Board.all.page(params[:page]).per(10)
#    else
      @boards = Board.where('title LIKE ?', "%#{ params[:keyword]}%").page(params[:page]).per(10)

#      @boards = Board.search(boar dwparams[:keyword]).per(10)


#    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = @current_user.id

    if @board.save
      redirect_to @current_user
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to @current_user
  end

  def destroy
    @board.destroy
    redirect_to @current_user
  end

  private

  def board_params
    params.require(:board).permit(:id, :title, :content)
  end

  def set_user
    @board = Board.find(params[:id])
  end
end
