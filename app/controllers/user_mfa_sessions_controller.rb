class UserMfaSessionsController < ApplicationController

  def new
    @user = User.find(session[:user_preid])
  end

  def create
    @user = User.find(session[:user_preid])
    if @user.google_authentic?(params[:auth][:mfa_code])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Wrong code"
      render :new
    end
  end
end
