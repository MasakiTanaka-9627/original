require "rails_helper"

RSpec.describe User, type: :model do
  it "バリデーションテストに成功する" do
    user = User.new(   
      name: "exampletest",
      email:  "aaaaa@rails.com",
      profile: "testprofile",
      password: "foobarexample"
      )
    expect(user).to be_valid
  end
end
