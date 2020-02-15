class Scraping
  
  def self.android
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

  def self.ios
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
