3.times do |user|
  3.times do |num|
    Board.create(title: "BoardID:#{num}",
                content: "掲示板#{num}_#{user}",
                user_id: user+1)
  end
end
