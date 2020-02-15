class ApplicationController < ActionController::Base
  include SessionsHelper

  helper_method :scraping_android
  helper_method :scraping_ios
  before_action :set_current_user

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

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
    puts "sucess_android"
  end

  def scraping_ios
    sleep(1)
    RecommendIosGame.delete_all
    agent = Mechanize.new
    page = agent.get("https://gamewith.jp/gamedb/ios/ranking/index")
    @elements = page.search(".gdb-ranking-box_title_text")
    @images = page.search(".gdb-ranking-box_img img")
    num = @elements.length
    num.times do |i|
      RecommendIosGame.create!(id: i, title: @elements[i].text, image: @images[i][:src])
    end
    puts "sucess_ios"
  end
end
