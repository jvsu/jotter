require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  describe "GET #share" do
    it "returns http success" do
      get :share
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add" do
    it "returns http success" do
      get :add
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #remove" do
    it "returns http success" do
      get :remove
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #all" do
    it "returns http success" do
      get :all
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unshare" do
    it "returns http success" do
      get :unshare
      expect(response).to have_http_status(:success)
    end
  end

end
