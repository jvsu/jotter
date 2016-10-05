require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'

feature "Home" do 

	before(:each){
		DatabaseCleaner.strategy = :truncation #i don't know why but you need this before every test to clean the db
	}
	after(:each){
		DatabaseCleaner.clean
		Capybara.reset_sessions!
		Capybara.use_default_driver
	}


#send pereson to the right page if there isn't a logged in user. 
	scenario "An unlogged in user " do 
		visit "/homes/index"
		expect(page).to have_content("You Must Login or SignUp")
	end

	scenario "Click New Note Button and See Form Appear" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_button "new_note_button"
		expect(page).to have_content("Add New Notes")
	end


	# click collection send you to the collections page 
	scenario "Click Collection Button" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Collection"
		expect(page).to have_content("All Collections")
	end

	scenario "Click Groups Button" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		expect(page).to have_content("Create New Group")
	end

	scenario "Click Logoff Button" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Logoff"
		expect(page).to have_content("You Are Logged Off")
	end


	scenario "Click Logoff Button" do 
		user = FactoryGirl.create(:user)
		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Subscribe to Tags"
		expect(page).to have_content("Your Tags")
	end


	#see discoved items

	scenario "See Discovered Items" do 
		user = FactoryGirl.create(:user)
		#create collection
		collection = FactoryGirl.create(:collection)
		tag = FactoryGirl.create(:tag)
		your_tag = FactoryGirl.create(:your_tag)

		visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		expect(page).to have_content("Test Collection")
	end


scenario "Create New Note" do 
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_button "new_note_button"
	within "#new_note" do 
		fill_in "collection[name]", :with=>"Da Collection Name"	
		fill_in "collection[url]", :with=>"fdasfas"	
		click_button "Submit"	
	end
	expect(page).to have_content("Da Collection Name")
end

	


	#save discovered items
	# scenario "Save Discovered Item" do 
	# 	user = FactoryGirl.create(:user)
	# 	#create collection
	# 	collection = FactoryGirl.create(:collection)
	# 	tag = FactoryGirl.create(:tag)
	# 	your_tag = FactoryGirl.create(:your_tag)
		
	# 	visit "/sessions/index"
	# 	within "#login" do	
	# 		fill_in "user[email]", :with=>"joe@yahoo.com"	
	# 		fill_in "user[password]", :with=>"aaaaaaaa"	
	# 		click_button "Submit"				
	# 	end
	# 	expect(page).to have_content("Test Collection")	
	# 	within ".collection" do 
	# 		click_button "Add to Notes"	
	# 	end
	# 	expect(page).to_not have_content("Test Collection")
	# end

	#create a new note from the homepage


end