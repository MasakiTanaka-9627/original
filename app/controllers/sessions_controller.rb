class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      pre_log_in user
      redirect_to new_user_mfa_session_path
    else
      flash[:danger] = 'パスワードとメールアドレスが登録されていません'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
