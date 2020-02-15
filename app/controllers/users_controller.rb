class UsersController < ApplicationController

  def index    
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit    
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    if user.save
      flash[:success] = '編集に成功しました'
      redirect_to current_user
    else
      flash[:danger] = '編集に失敗しました。'
      redirect_to edit_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @boards = @user.boards.page(params[:page]).per(10)
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to user
    else
      flash[:danger] = 'ユーザーの登録に失敗しました。'
      redirect_to new_user_path, flash: { error: @user.errors.full_messages}
    end
  end

  def destroy 
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user.id)
    @user = User.find(params[:id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :profile, :password, :password_confirmation)
  end
  
end
