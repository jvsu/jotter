require 'spec_helper'
require 'rails_helper'
require 'database_cleaner'


feature "Groups" do 
	before(:each){
		DatabaseCleaner.strategy = :truncation #i don't know why but you need this before every test to clean the db
	}
	after(:each){
		DatabaseCleaner.clean
		Capybara.reset_sessions!
		Capybara.use_default_driver
	}

#from homes#index click groups see existing groups
scenario "get to all your groups" do 
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


scenario "shows all the groups you hve created" do 
	new_group = FactoryGirl.create(:group)
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		expect(page).to have_content("group1")
end



#click existing group go to the right view... look for Add Notes

scenario "click an existing group" do 
	new_group = FactoryGirl.create(:group)
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		click_link "group1"
		expect(page).to have_content("Add Note")
end


#delete Group
scenario "click an existing group" do 
	new_group = FactoryGirl.create(:group)
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		click_link "Delete"
		expect(page).to have_content("Group Deleted")
end



#create new group 
scenario "click an existing group" do 
	new_group = FactoryGirl.create(:group)
	user = FactoryGirl.create(:user)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		fill_in "group[name]", :with=>"new group"
		click_button "Submit"
		expect(page).to have_content("new group")
end


scenario "Show existing Group Note" do 

	user = FactoryGirl.create(:user)
	note = FactoryGirl.create(:note)
	new_group = FactoryGirl.create(:group)
	group_note = FactoryGirl.create(:group_note)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		click_link "group1"
		expect(page).to have_content("MyString")
end


#Note Removed
scenario "Remove existing Group Note" do 
	user = FactoryGirl.create(:user)
	note = FactoryGirl.create(:note)
	new_group = FactoryGirl.create(:group)
	group_note = FactoryGirl.create(:group_note)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		click_link "group1"
		click_button "Remove"
		expect(page).to have_content("Note Removed")
end

scenario "See group_notes to add Group Note" do 
	user = FactoryGirl.create(:user)
	collection = Collection.new(user_id:1, url:"fdasfasd", name:"collection1").save
	note = FactoryGirl.create(:note)
	new_group = FactoryGirl.create(:group)
	visit "/sessions/index"
		within "#login" do	
			fill_in "user[email]", :with=>"joe@yahoo.com"	
			fill_in "user[password]", :with=>"aaaaaaaa"	
			click_button "Submit"				
		end
		click_link "Groups"
		click_link "group1"
		click_link "Add Note"
		expect(page).to have_content("MyString")
end





# scenario "click to see notes from newly created group" do 
# 		new_group = FactoryGirl.create(:group)
# 	user = FactoryGirl.create(:user)
# 	visit "/sessions/index"
# 		within "#login" do	
# 			fill_in "user[email]", :with=>"joe@yahoo.com"	
# 			fill_in "user[password]", :with=>"aaaaaaaa"	
# 			click_button "Submit"				
# 		end
# 		click_link "Groups"
# 		fill_in "group[name]", :with=>"new group"
# 		click_button "Submit"
# 		click_link "New Group"
# 		expect(page).to have_content("Add Note")
# end





#click add note, click add look for remove button


#test player







end