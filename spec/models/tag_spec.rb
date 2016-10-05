require 'rails_helper'

RSpec.describe Tag, type: :model do
 

#test validations

subject{Tag.new(collection_id:1, tag_name:"business")}


it "is valid if all inputs are correct" do 
	expect(subject).to be_valid
end

it "is invalid if collection_id is blank" do 
	subject.collection_id = ""
	expect(subject).to be_invalid
end


it "is invalid if collection_id is not a number" do 
	subject.collection_id = "a"
	expect(subject).to be_invalid

end

it "is invalid if tag_name is blank" do
	subject.tag_name = ""
	expect(subject).to be_invalid
end



 #test methods 

#collection_tag get all the tags that belong to you. 

it "Returns an Array of collection_ids that match my tag preferecnes" do 

#create a user
user = FactoryGirl.build(:user)

#user has 2 your_tag entries that are business and tedtalks
 yt1 = YourTag.new(user_id:1, tag:"business").save
 yt2 = YourTag.new(user_id:1, tag:"tedtalks").save

 #create 2 collections that aren't yours, share is true for each 
 collection1 = Collection.new(name:"TedTalk 1", user_id:2, url:"dfsfsdafsda", share:true).save
 collection2 = Collection.new(name:"Business Talk 2", user_id:2, url:"dfsfsdafsda", share:true).save
 #collections have 2 different tags business and tedtalks
 tag1 = Tag.new(collection_id:1,tag_name:"tedtalks").save
 tag2 = Tag.new(collection_id:2,tag_name:"business").save
#execute the method passing in the user_id 1
collection_array = described_class.collection_tag(1)

#check if array [1,2] is returned
expect(collection_array[0]).to eq(1)
expect(collection_array[1]).to eq(2)

end



it "valid tags return true" do
	#create collection 
	collection = FactoryGirl.build(:collection)
	share= described_class.share("#hello #kanye",1)
	expect(share).to eq(true)



end



it "invalid tags return false" do 
	collection = FactoryGirl.build(:collection)
	share= described_class.share("hello kanye music cray",1)
	expect(share).to eq(false)


end






end
