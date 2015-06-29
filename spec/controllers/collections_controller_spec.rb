require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
   describe "POST #create" do
    it "returns http success" do
      post(:create, :collection=>{url:"vdsfakjd",user_id:1, name:'History of Computers'})
      expect(response).to have_http_status(:found)
    end

    it "redirects to notes/new/collection if collection is created" do 
       post(:create, :collection=>{url:"vdsfakjd",user_id:1, name:'History of Computers'})
       expect(response).to redirect_to("/notes/new/1")
    end

    it "redirects to /homes/index if collection isn't created" do 
      post(:create, :collection=>{url:"vdsfdsa",user_id:'', name:"History of Computers"})
      expect(response).to redirect_to("/homes/index")
    end

    it "creates flash messsage if collection isn't created" do 
      post(:create, :collection=>{url:"vdsfdsa",user_id:'', name:"History of Computers"})
      expect(flash['message']).to eq (["User can't be blank", "User is not a number"])
    end
  end


  describe "GET request #all" do 
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
      Collection.new(user_id:1, name:"TedTalk", url:'fdsafdsafd').save
    }

    before(:example){
      Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
    }

    before(:example){
       session[:user_id] =1
    }
    let(:user){
      @user = User.first
    }
    let(:collections){
      @collection = Collection.all.where(user_id:1)
    }
    let(:notes){
      @notes = Note.all.where(user_id:1)
    }

    it "returns http success" do 
     #problem is session[:user_id] 
      get :all
      expect(response).to have_http_status(:success)
    end

    it "assigns session_id to @user" do 
      get :all 
      expect(assigns['user']).to eq(user)
    end

    it "@collection gets all the collections that belongt to the user" do
      get :all
      expect(assigns['collections']).to eq(collections)

    end

    it " Assigns all the user notes to @notes" do
      get :all
      expect(assigns['notes']).to eq(notes)
    end
  end


  describe "GET #destroy" do

    before(:example){
      Collection.new(user_id:1, name:"TedTalk", url:'fdsafdsafd').save
    }
    let(:message){
      message = 'Collection Deleted'
    }
    it "returns http success" do
      get(:destroy,:collection_id=>1)
      expect(response).to have_http_status(:found)
    end
    it "Creates Flash Message when Collection is deleted" do 
      get(:destroy,:collection_id=>1)
      expect(flash['message']).to eq(message)
    end
    it "Redirects to /collections/all after collection is deleted" do 
      get(:destroy,:collection_id=>1)
      expect(response).to redirect_to("/collections/all")      
    end

  end

end
