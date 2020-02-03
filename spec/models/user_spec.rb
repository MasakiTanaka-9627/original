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

    user.name = "a"* 4
    expect(user).not_to be_valid
    user.name = "a"* 5
    expect(user).to be_valid

    user.name = "a"* 15
    expect(user).to be_valid
    user.name = "a"* 16
    expect(user).not_to be_valid
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

  it "profileのバリデーション" do
    user = User.new(   
      name: "exampletest",
      email:  "admin@rails.com",
      password: "foobarexample"
      )
    
    user.profile = "a"* 7
    expect(user).not_to be_valid
    user.profile = "a"* 8
    expect(user).to be_valid
  end

  it "passwordバリデーション" do
    user = User.new(   
      name: "exampletest",
      email:  "admin@rails.com",
      profile: "testprofile",
      )
    
    user.password = "a"* 7
    expect(user).not_to be_valid      
    user.password = "a"* 8
    expect(user).to be_valid
  end


end
