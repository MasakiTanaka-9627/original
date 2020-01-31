class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # どこのページからリクエストが来たか保存しておく
  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # 現在のURLを保存しておく
    session[:request_from] = request.original_url
  end

  # 前の画面に戻る
  def return_back
    if request.referer
      redirect_to :back and return true
    elsif @request_from
      redirect_to @request_from and return true
    end
  end

  before_action :set_current_user

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :dange

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
