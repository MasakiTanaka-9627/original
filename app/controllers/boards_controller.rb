class BoardsController < ApplicationController

  def index
    @board = Board.all.page(params[:page]).per(10)
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
    @board = Board.find(params[:id])
  end 

  def edit
    @board = Board.find(params[:id])
  end 

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to @current_user
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to @current_user
  end

  private

  def board_params
    params.require(:board).permit(:id, :title, :content)
  end
  
end
