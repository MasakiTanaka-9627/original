class BoardsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @tag_id = params[:tag_id]

    if params[:keyword].blank?
      @boards = params[:tag_id].present? ? Tag.find(@tag_id).boards : Board.all
      @boards = @boards.page(params[:page]).per(10)
    else 
      tag = BoardTagRelation.tag_search(@tag_id).first
      @boards =  Board.search(params[:keyword]).where(id: tag.board_id).page(params[:page]).per(10)
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id

    if @board.save
      redirect_to current_user
    else
      flash[:danger] = '投稿に失敗しました。'
      redirect_to new_board_path, flash: { error: @board.errors.full_messages}
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
      flash[:success] = '編集に成功しました。'
      redirect_to current_user
    else
      flash[:danger] = '編集に失敗しました。'
      redirect_to edit_board_path(@board.id), flash: { error: @board.errors.full_messages}
    end
  end

  def destroy
    @board.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def board_params
    params.require(:board).permit(:id, :title, :content, tag_ids: [])
  end

  def set_user
    @board = Board.find(params[:id])
  end
end
