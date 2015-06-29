require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post #sign_up' do

    let(:user_id){
      @user_id = 1
    }
    let(:user){

      @user = User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa')

    }

    it "returns http found if all inputs are there" do 
      post(:sign_up, :user=>{first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa'})
      # it redirects you 
      expect(response).to have_http_status(:found)
    end

    it "redirects you to /homes/index when you successfully sign in" do
      post(:sign_up, :user=>{first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa'})
      expect(response).to redirect_to('/homes/index')
    end

    it "redirects you to /sessions/index if there is an error" do 
       post(:sign_up, :user=>{first_name:'joseph', last_name:'su',user_name:'', email:'joe@yahoo.com', password:'aaaaaaaa'})
      expect(response).to redirect_to('/sessions/index')
    end
  end

  describe 'post #sign_in' do 
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
     let(:user_id){
        @user_id = 1
    }


    it "Returns http found" do 
      post(:sign_in, :user=>{email:'joe@yahoo.com',password:'aaaaaaaa'})
      expect(response).to have_http_status(:found)
    end

    it "Redirects you to /home/index if credentials are correct" do
       post(:sign_in, :user=>{email:'joe@yahoo.com',password:'aaaaaaaa'})
       expect(response).to redirect_to('/homes/index')
    end


    it "Redirects you to /sessions/index if credentials are incorrect" do
       post(:sign_in, :user=>{email:'dave@gmail.com',password:'aaaaaaaa'})
       expect(response).to redirect_to('/sessions/index')
    end

    it "Assigns session[user_id] if you get the right credentials" do 
        post(:sign_in, :user=>{email:"joe@yahoo.com",password:"aaaaaaaa"})
         expect(session['user_id']).to eq(user_id)
    end

    it "Doesn't set session[user_id] if email is not found" do
        post(:sign_in, :user=>{email:"john@yahoo.com",password:"aaaaaaaa"})
         expect(session['user_id']).to be_nil    
    end

    it "Doesn't set session[user_id] if password is incorrect" do
        post(:sign_in, :user=>{email:"joe@yahoo.com",password:"rosebud"})
         expect(session['user_id']).to be_nil    
    end
   
    it "Sets Flash Message if incorrect credentials" do
      post(:sign_in, :user=>{email:"john@yahoo.com",password:"aaaaaaaa"})
      expect(flash['message']).to eq('Email or Password Not Correct')
    end

    it "sets @user to nil if user's email not found" do
      post(:sign_in, :user=>{email:"john@yahoo.com",password:"aaaaaaaa"})
      expect(assigns['user']).to be_nil
    end

    it "Sets @user to nil if user's email is blank" do
      post(:sign_in, :user=>{email:"",password:"aaaaaaaa"})
      expect(assigns['user']).to be_nil
    end
  end


end
