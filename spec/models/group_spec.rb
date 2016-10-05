require 'rails_helper'

RSpec.describe Group, type: :model do
 	subject{described_class.new(user_id:1,name:"Video Lecture")}

 	it "is valid if all inputs are correct" do 
 		expect(subject).to be_valid
 	end

 	it "is invalid if user_id is blank" do 
 		subject.user_id = ""
 		expect(subject).to be_invalid
 	end

 	it "is invalid if user_id is not a number" do
 		subject.user_id = "a"
 		expect(subject).to be_invalid

 	end

 	it "is invalid if name is blank" do 
 		subject.name = ""
 		expect(subject).to be_invalid
 	end

 	describe "Associations" do
 		it "has many group_notes" do 
			assc = described_class.reflect_on_association(:group_notes)
	    	expect(assc.macro).to eq :has_many
 		end
 	end
end
