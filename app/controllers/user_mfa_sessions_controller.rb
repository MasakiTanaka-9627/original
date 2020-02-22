class UserMfaSessionsController < ApplicationController

  def new
    @user = User.find(session[:user_preid])
  end

  def create
    @user = User.find(session[:user_preid])
    if @user.google_authentic?(params[:auth][:mfa_code])
      session[:user_id] = @user.id
      flash[:success] = '認証に成功しました'
      redirect_to user_path
    else
      flash[:danger] = "認証に失敗しました。"
      render :new
    end
  end
end
