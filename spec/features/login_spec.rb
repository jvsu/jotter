require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'


feature "Login" do 
	before(:each){
		DatabaseCleaner.strategy = :truncation #i don't know why but you need this before every test to clean the db
	}
	after(:each){
		DatabaseCleaner.clean
		Capybara.reset_sessions!
		Capybara.use_default_driver
	}

	scenario "Login User" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
			expect(page).to have_content("Collection") 
	end
	

	scenario "Wrong Password" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaafdasdsa"	
			click_button "Submit"				
		end
			expect(page).to have_content("Email or Password Not Correct") 
	end
	

	scenario "Invalid Email" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"jose@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
			expect(page).to have_content("Email or Password Not Correct") 
	end


	scenario "All Blank Inputs" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>""	
			fill_in "user[password]", :with=>""	
			click_button "Submit"				
		end
			expect(page).to have_content("Email or Password Not Correct") 
	end
end