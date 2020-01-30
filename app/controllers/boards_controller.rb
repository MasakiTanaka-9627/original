class BoardsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:keyword].blank?
      @boards = Board.all.page(params[:page]).per(10)
    else 
      @boards =  Board.search(params[:keyword]).page(params[:page]).per(10)
    end
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
      flash.now[:danger] = '投稿に失敗しました。'
      render action: :new
    end
  end

  def show
    @boards = Board.all
    @comments = @board.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    @board.update(board_params)
    if @board.save
      redirect_to @current_user
    else
      flash.now[:danger] = '編集に失敗しました。'
      render action: :new
    end
  end

  def destroy
    @board.destroy
    redirect_to @current_user
  end

  private

  def board_params
    params.require(:board).permit(:id, :title, :content, tag_ids: [])
  end

  def set_user
    @board = Board.find(params[:id])
  end
end
