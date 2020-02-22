require "rails_helper"

RSpec.describe User, type: :model do
    
  it "バリデーションテストに成功する" do
    user = User.new(   
      name: "exampletest",
      email:  "admin@rails.com",
      profile: "testprofile",
      password: "foobarexample"
      )
    expect(user).to be_valid
  end

  it "nameバリデーション" do
    user = User.new(   
      email:  "admin@rails.com",
      profile: "testprofile",
      password: "foobarexample"
      )

    user.name = ""
    expect(user).not_to be_valid
    user.name = "a"
    expect(user).to be_valid
  end

  it "emailバリデーション" do
    user = User.new(   
      name: "exampletest",
      profile: "testprofile",
      password: "foobarexample"
      )
    
    user.email = "admirails"
    expect(user).not_to be_valid
  end

  it "passwordバリデーション" do
    user = User.new(   
      name: "exampletest",
      email:  "admin@rails.com",
      profile: "testprofile",
      )
    
    user.password = "a"* 4
    expect(user).not_to be_valid      
    user.password = "a"* 5
    expect(user).to be_valid
  end


end
