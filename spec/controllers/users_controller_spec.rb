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

   describe 'Post #create' do
    context '有効なパラメータの場合' do
      before do
        @user = attributes_for(:user)
      end
      it 'リクエストは302 リダイレクトとなること' do
        post :create, user: @user
        expect(response.status).to eq 302
      end
    end
  end
end 