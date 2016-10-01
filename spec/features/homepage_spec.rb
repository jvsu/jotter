require 'spec_helper'
require 'rails_helper'

feature "Homepage" do 
	scenario "visit / or root page" do 
		visit "/"
		expect(page).to have_content("Sign Up/Login")
	end

	scenario "click signup/login button" do 
		visit "/"
		click_link "Sign Up/Login"
		expect(page).to have_content("Home") #it's for the button to go home from the login and sign up page
	end

end

