class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_current_user

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  helper_method :scraping_android
  helper_method :scraping_ios

  def scraping_android
    sleep(1)
    RecommendGame.delete_all
    agent = Mechanize.new
    page = agent.get("https://gamewith.jp/gamedb/android/ranking/index")
    @elements = page.search(".gdb-ranking-box_title_text")
    @images = page.search(".gdb-ranking-box_img img")
    num = @elements.length
    num.times do |i|
      RecommendGame.create(id: i, title: @elements[i].text, image: @images[i][:src])
    end
  end

  def scraping_ios
      sleep(1)
      RecommendGame.delete_all
      agent = Mechanize.new
      page = agent.get("https://gamewith.jp/gamedb/ios/ranking/index")
      @elements = page.search(".gdb-ranking-box_title_text")
      @images = page.search(".gdb-ranking-box_img img")
      num = @elements.length
      num.times do |i|
        RecommendGame.create!(id: i, title: @elements[i].text, image: @images[i][:src])
      end
  end
end
