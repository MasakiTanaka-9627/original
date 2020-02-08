require "rails_helper"

# user =  FactoryBot.create(:user)

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it 'リクエストが成功すること' do
        get :index
        expect(response.status).to eq 200
      end
   end
   describe "GET #new" do
    it 'リクエストが成功すること' do
        get :new
        expect(response.status).to eq 200
      end
   end
end
