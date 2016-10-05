require 'rails_helper'

RSpec.describe GroupNote, type: :model do
 	subject{described_class.new(note_id:1,group_id:1,user_id:1)}

 	it "is valid if inputs are good" do 
 		expect(subject).to be_valid
 	end

 	it "is invalid if note_id is blank" do 
 		subject.note_id = ""
 		expect(subject).to be_invalid
 	end

 	it "invalid if note_id is not a number" do 
 		subject.note_id = "a"
 		expect(subject).to be_invalid	
 	end


 	it "is invalid if group_id is blank" do
 		subject.group_id = ""
 		expect(subject).to be_invalid
 	end

 	it "is invalid if group_id is not a number" do
 		subject.group_id = "a"
 		expect(subject).to be_invalid
 	end

 	it "is invalid user_id is blank" do 
 		subject.user_id = ""
 		expect(subject).to be_invalid
 	end

 	it "is invalid user_id is not a number" do 
 		subject.user_id = "a"
 		expect(subject).to be_invalid
 	end

end
