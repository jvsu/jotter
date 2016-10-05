require 'rails_helper'

RSpec.describe Note, type: :model do
  
  subject{described_class.new(url:"dfasfdas", user_id:1,start_time:100, time_stamp_h:30, time_stamp_m:30,time_stamp_s:12, notes:"this is a new note", collection_id:1)}

  #validations
  it "is valid if all inputs are valid" do 
  	expect(subject).to be_valid
  end


  it "is invalid if notes are blank" do 
  	subject.notes = ""
  	expect(subject).to be_invalid
  end


  it "is invalid if url are blank" do 
  	subject.url = ""
  	expect(subject).to be_invalid
  end



   it "is invalid if user_id are blank" do 
  	subject.user_id= ""
  	expect(subject).to be_invalid
  end

  it "is invalid if user_id is not a number" do 
  	subject.user_id="a"
  	expect(subject).to be_invalid
  end



  it "is invalid if start_time are blank" do 
  	subject.start_time = ""
  	expect(subject).to be_invalid
  end

   it "is invalid start_time is not a number" do 
  	subject.start_time="a"
  	expect(subject).to be_invalid
  end


it "is invalid if time_stamp_h are blank" do 
  	subject.time_stamp_h = ""
  	expect(subject).to be_invalid
  end


it "is invalid if time_stamp_h is not a number" do 
  	subject.time_stamp_h = "a"
  	expect(subject).to be_invalid
  end



it "is invalid if collection_id are blank" do 
  	subject.collection_id = ""
  	expect(subject).to be_invalid
  end


  it "is invalid if collection_id is not a number" do 
  	subject.collection_id = "a"
  	expect(subject).to be_invalid
  end

it "is invalid if time_stamp_m are blank" do 
  	subject.time_stamp_m= ""
  	expect(subject).to be_invalid
  end

it "is invalid if time_stamp_m is not a number" do 
  	subject.time_stamp_m= "a"
  	expect(subject).to be_invalid
  end


it "is invalid if time_stamp_s are blank" do 
  	subject.time_stamp_s = ""
  	expect(subject).to be_invalid
 end

it "is invalid if time_stamp_s is not a number" do 
  	subject.time_stamp_s = "a"
  	expect(subject).to be_invalid
 end


#Associations

describe "associations" do 
	it "has many group_notes" do 
    	assc = described_class.reflect_on_association(:group_notes)
    	expect(assc.macro).to eq :has_many
  	end

  	it "has many point_supports" do 
    	assc = described_class.reflect_on_association(:point_supports)
    	expect(assc.macro).to eq :has_many
  	end

end

#methods

it "returns a true if the number is a valid float" do
	 method_call =  described_class.valid_float("5")
	 expect(method_call).to be(true)
end

it "returns a false if the number is not a valid float" do
	 method_call =  described_class.valid_float("bb")
	 expect(method_call).to be(false)
end


it "time_stamp method returns the proper time_stamp" do 
	 method_call =  described_class.time_stamp(1,10,1)
	 # should return values in seconds 1H(3600),10(600) minutes, 1 second 
	 time_stamp = method_call[:time_stamp]
	 expect(time_stamp).to eq(4201)
end




end
