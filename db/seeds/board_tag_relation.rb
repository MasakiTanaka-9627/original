10.times do |num|
  BoardTagRelation.create(board_id: num + 1,
                          tag_id: rand(4) + 1)
end
