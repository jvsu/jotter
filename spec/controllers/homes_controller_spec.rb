require 'rails_helper'

RSpec.describe HomesController, type: :controller do

 describe "GET #index" do
  	before(:example){
       User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
  	}

  	before(:example){
  		session[:user_id] = 1
  	}
  	before(:example){
  		Collection.new(user_id:1, name:"TedTalk", url:'fdsafdsafd').save
  	}
  	let(:user){
  		@user = User.find(1)
  	}

  	let(:user_collection){
  		@collection = Collection.all.where(:user_id=>1)
  	}

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns current user information to @user" do 
    	get :index
    	expect(assigns['user']).to eq(user)
    end

    it "assigns all the current user's collection to @collections" do
    	get :index
    	expect(assigns['collections']).to eq(user_collection)
    end

  end

end
