require "rails_helper"

RSpec.describe User, type: :model do
  it "バリデーションテストに成功する" do
    user = User.new(
      name: "exampletest",
      email: "admin@rails.com",
      profile: "testprofile",
      password: "foobarexample",
      password_confirmation: "foobarexample",
    )
    expect(user).to be_valid
  end
end
