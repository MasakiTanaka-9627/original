class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @boards = @user.boards.page(params[:page]).per(10)
  end

  def create
    @user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :introduce, :age, :sex, :address)
  end

end
