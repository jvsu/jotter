require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'


feature "New Notes" do 
	before(:each){
		DatabaseCleaner.strategy = :truncation #i don't know why but you need this before every test to clean the db
	}
	after(:each){
		DatabaseCleaner.clean
		Capybara.reset_sessions!
		Capybara.use_default_driver
	}

	# scenario "create a new collection" do 
	# 	user = FactoryGirl.create(:user)
	# 	visit "/sessions/index"
	# 	within "#login" do	
	# 		fill_in "user[email]", :with=>"joe@yahoo.com"	
	# 		fill_in "user[password]", :with=>"aaaaaaaa"	
	# 		click_button "Submit"				
	# 	end
	# 	click_button "new_note_button"
	# 	within "#new_note" do 
	# 		fill_in "collection[name]", :with=>"Da Collection Name"	
	# 		fill_in "collection[url]", :with=>"fdasfas"	
	# 		click_button "Submit"	
	# 	end
	# 	within "#ts" do 
	# 		fill_in "note[start_timeh]", :with=>1
	# 		fill_in "note[start_time1]", :with=>10	
	# 		fill_in "note[start_time1]", :with=>20
	# 	end
	# 	fill_in "note[notes]", :with=>"text note goes here"
	# 	click_button "Submit"
	# 	expect(page).to have_content("1H10M20S")
	# end	


	scenario "go back to home" do 
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
		click_link "Home"
		expect(page).to have_content("Discover")
	end




	scenario "go to your collections" do 
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
		click_link "Collections"
		expect(page).to have_content("All Collections")
	end












end