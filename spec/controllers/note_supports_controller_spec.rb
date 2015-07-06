require 'rails_helper'

RSpec.describe NoteSupportsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #all_groups" do
    it "returns http success" do
      get :all_groups
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #group" do
    it "returns http success" do
      get :group
      expect(response).to have_http_status(:success)
    end
  end

end
