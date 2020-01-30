class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
binding.pry
    if @user.save
      redirect_to current_user
    else
      flash.now[:danger] = '編集に失敗しました。'
      render action: :new
    end
  end

  def show
    @user = User.find(params[:id])
    @boards = @user.boards.page(params[:page]).per(10)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :password_confirmation)
  end

end
