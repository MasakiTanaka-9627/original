require 'rails_helper'

RSpec.describe Board, type: :model do

  it "バリデーションテストに成功する" do
    board = Board.new(   
      title: "titletest",
      content: "contenttest",
      user_id: 1
      )
    expect(board).to be_valid
    expect(board).to be_valid
  end

  it "titleバリデーション" do
    board = Board.new(   
        content: "contenttest",
        user_id: 1
        )

    board.title = ""
    expect(board).not_to be_valid
    board.title = "a"
    expect(board).to be_valid
  end

  it "contentバリデーション" do
    board = Board.new( 
        title: "titletest",  
        user_id: 1
        )

    board.content = ""
    expect(board).not_to be_valid
    board.content = "a"
    expect(board).to be_valid
  end

end
