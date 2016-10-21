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


#all collections view: Create 2 collections then do two checks to see if they are on the page 

scenario "See all Your Collections" do 
	user = FactoryGirl.create(:user)
	note1 = Collection.new(user_id:1,url:"youtubelink",name:"collection1").save
	note2 = Collection.new(user_id:1,url:"youtubelink",name:"collection2").save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	expect(page).to have_content("collection1")
	expect(page).to have_content("collection2")
end



# crreate one collection, all Colletions, click share, Add tags title 

#should have published button

scenario "Should have publish button available is not shared" do 
	user = FactoryGirl.create(:user)
	note1 = Collection.new(user_id:1,url:"youtubelink",name:"collection1").save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	expect(page).to have_content("Publish")
end


scenario "Should have  Unshare button available if it is being unshared" do 
	user = FactoryGirl.create(:user)
	note1 = Collection.new(user_id:1,url:"youtubelink",name:"collection1",share:true).save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	expect(page).to have_content("UnShare")

end




#All collections, check to see if it does have the naem,  click delete, shouldn't have the name 
scenario "Delete Collection" do 
	user = FactoryGirl.create(:user)
	note1 = Collection.new(user_id:1,url:"youtubelink",name:"collection1",share:true).save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	click_link "Delete"
	expect(page).to_not have_content("collection1")
end



#edit sends you to that view page with specific title. 

scenario "Edit a note" do 
	user = FactoryGirl.create(:user)
	collection = Collection.new(user_id:1,url:"youtubelink",name:"collection1",share:true).save
	note = Note.new(url:"dfasfdas", user_id:1,start_time:100, time_stamp_h:30, time_stamp_m:30,time_stamp_s:12, notes:"this is a new note", collection_id:1).save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	click_link "Edit"
	expect(page).to have_content("this is a new note")
end



#click title sends you to add notes view 
scenario "Edit a note" do 
	user = FactoryGirl.create(:user)
	collection = Collection.new(user_id:1,url:"youtubelink",name:"collection1",share:true).save
	note = Note.new(url:"dfasfdas", user_id:1,start_time:100, time_stamp_h:30, time_stamp_m:30,time_stamp_s:12, notes:"this is a new note", collection_id:1).save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	click_link "collection1"
	expect(page).to have_content("New Note")
	expect(page).to have_content("Note View")
end

scenario "Edit a note" do 
	user = FactoryGirl.create(:user)
	collection = Collection.new(user_id:1,url:"youtubelink",name:"collection1",share:true).save
	note = Note.new(url:"dfasfdas", user_id:1,start_time:100, time_stamp_h:30, time_stamp_m:30,time_stamp_s:12, notes:"this is a new note", collection_id:1).save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	click_link "Home"
	expect(page).to have_content("New Note")
end


scenario "An unlogged in user vists page " do 
	visit "/collections/all"
	expect(page).to have_content("You Must Login or Signup")
end


#saved content link 
scenario "Should have publish button available is not shared" do 
	user = FactoryGirl.create(:user)
	note1 = Collection.new(user_id:2,url:"youtubelink",name:"saved1").save
	save = Save.new(user_id:1,collection_id:1).save
	visit "/sessions/index"
	within "#login" do	
		fill_in "user[email]", :with=>"joe@yahoo.com"	
		fill_in "user[password]", :with=>"aaaaaaaa"	
		click_button "Submit"				
	end
	click_link "Collection"
	click_link "Subscribed Collections"
	expect(page).to have_content("saved1")
end




# share feature, turns button into unshare. 

# scenario "Should have publish button available is not shared" do 
# 	user = FactoryGirl.create(:user)
# 	note1 = Collection.new(user_id:1,url:"youtubelink",name:"collection1").save
# 	visit "/sessions/index"
# 	within "#login" do	
# 		fill_in "user[email]", :with=>"joe@yahoo.com"	
# 		fill_in "user[password]", :with=>"aaaaaaaa"	
# 		click_button "Submit"				
# 	end
# 	click_link "Collection"
	
# 	within ".pbutton" do 
# 		click_button "Publish"
# 	end
	
# 	fill_in "tag[tag_name]", :with=>"#default"	
# 	within ".pub_info" do 
# 		click_button "Publish"
# 	end
# 	expect(page).to have_content("UnShare")
# end




# click play should have HTML element for video player

# scenario "Click Play Button to play video at time stamp", js:true do 
# 	# user = FactoryGirl.create(:user)
# 	user = User.new(first_name:'joseph', last_name:'su',user_name:'jvsu',email:'joe123@yahoo.com',password:"aaaaaaaa").save
# 	collection = Collection.new(user_id:1,url:"youtubelink",name:"collection1",share:true).save
# 	note = Note.new(url:"dfasfdas", user_id:1,start_time:100, time_stamp_h:30, time_stamp_m:30,time_stamp_s:12, notes:"this is a new note", collection_id:1).save
# 	visit "/sessions/index"
# 	within "#login" do	
# 		fill_in "user[email]", :with=>"joe123@yahoo.com"	
# 		fill_in "user[password]", :with=>"aaaaaaaa"	
# 		click_button "Submit"				
# 	end
# 	click_link "Collection"
# 	click_button "Play"
# 	video = find("#ytplayer")
# 	# video = find_by_id("#ytplayer")
# 	expect(video).to be(true)

# # Can't find the id of the video that is appended to the page
# end







end