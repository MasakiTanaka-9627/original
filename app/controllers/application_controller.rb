class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_current_user

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :dange

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
