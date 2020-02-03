require 'rails_helper'

RSpec.describe Board, type: :model do

  it "バリデーションテストに成功する" do
    board = Board.new(   
      title: "titletest",
      content: "contenttest",
      )
    expect(board).to be_valid
  end

end
