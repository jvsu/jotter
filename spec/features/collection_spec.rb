require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'


feature "Collection" do 
	before(:each){
		DatabaseCleaner.strategy = :truncation #i don't know why but you need this before every test to clean the db
	}
	after(:each){
		DatabaseCleaner.clean
		Capybara.reset_sessions!
		Capybara.use_default_driver
	}



scenario "Create New Collection" do 
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


scenario "Create New Collection without Name" do 
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_button "new_note_button"
	within "#new_note" do 
		fill_in "collection[name]", :with=>""	
		fill_in "collection[url]", :with=>"fdasfas"	
		click_button "Submit"	
	end
	expect(page).to have_content("Name can't be blank")

end


scenario "Create New Collection without URL" do 
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_button "new_note_button"
	within "#new_note" do 
		fill_in "collection[name]", :with=>"fdsafsda"	
		fill_in "collection[url]", :with=>""	
		click_button "Submit"	
	end
	expect(page).to have_content("Url can't be blank")

end





end