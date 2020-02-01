class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログインに成功しました。'
      redirect_to user_url(id: user.id)
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
