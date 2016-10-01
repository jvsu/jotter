require 'rails_helper'
require 'spec_helper'

RSpec.describe "Sessions", type: :request do
  describe "Root Page" do
    it "roots to sessions#home " do
      get "/"
      page.should have_content("Learn More")
    end
  end
end
