require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'


feature "Signup" do 
	before(:each){
		DatabaseCleaner.strategy = :truncation #i don't know why but you need this before every test to clean the db
	}
	after(:each){
		DatabaseCleaner.clean
		Capybara.reset_sessions!
  		Capybara.use_default_driver
	}

	scenario "new signup" do 
		visit "/sessions/index"
		expect(page).to have_content("Home")
	end

	scenario "successful signup" do 
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>"jvsu"		
			fill_in "user[first_name]", :with=>"joe"
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>"jose@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Collection") 
	end

	scenario "missing user_name" do
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>""		
			fill_in "user[first_name]", :with=>"joe"
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>"jose@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("User name can't be blank") 
	end
	scenario "missing first_name" do
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>"dafsd"		
			fill_in "user[first_name]", :with=>""
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>"jose@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("First name can't be blank") 
	end

	scenario "missing last_name" do
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>"dafsd"		
			fill_in "user[first_name]", :with=>"dsadsf"
			fill_in "user[last_name]", :with=>""		
			fill_in "user[email]", :with=>"jose@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Last name can't be blank") 
	end

	scenario "missing email" do
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>"dafsd"		
			fill_in "user[first_name]", :with=>"joe"
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>""	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Email can't be blank") 
	end

	scenario "invalid email" do
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>"dafsd"		
			fill_in "user[first_name]", :with=>"fdas"
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>"jo"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Email is invalid") 
	end

	scenario "invalid email" do
		visit "/sessions/index"
		within "#sign_up" do
			fill_in "user[user_name]", :with=>"dafsd"		
			fill_in "user[first_name]", :with=>"fdas"
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>"jo"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Email is invalid") 
	end

	scenario "duplicate email" do
		visit "/sessions/index"
		within "#sign_up" do
			User.new(user_name:"jvsu",first_name:"joe",last_name:"su",email:"joe_su@yahoo.com",password:"aaaaaaaa").save
			fill_in "user[user_name]", :with=>"dafsd"		
			fill_in "user[first_name]", :with=>"fdas"
			fill_in "user[last_name]", :with=>"su"		
			fill_in "user[email]", :with=>"joe_su@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Email has already been taken") 
	end

end

