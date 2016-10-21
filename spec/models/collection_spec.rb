require 'rails_helper'

RSpec.describe Collection, type: :model do
 	  subject{described_class.new(user_id:1,url:"youtube",name:"Video Lecture")}


 	 it	"is valid if all parameters are correct" do 
 	 	expect(subject).to be_valid

 	 end

 	 it "is not valid if user_id is blank" do
 	 	subject.user_id =""
 	 	expect(subject).to be_invalid

 	 end

 	 it "is not valid if user_id is not a number" do 
 	 	subject.user_id = "a"
 	 	expect(subject).to be_invalid
 	 end

 	 it "is not valid if youtube url is blank" do 
 	 	subject.url = ""
 	 	expect(subject).to be_invalid
 	 end


 	 it "is not valid if name is blank" do 
 	 	subject.name = ""
 	 	expect(subject).to be_invalid
 	 end

	describe "Associations" do 
	  it "has many saves" do 
	    assc = described_class.reflect_on_association(:saves)
	    expect(assc.macro).to eq :has_many
	  end

	  it "has many tags" do 
	    assc = described_class.reflect_on_association(:tags)
	    expect(assc.macro).to eq :has_many
	  end

	  it "has many notes" do 
	    assc = described_class.reflect_on_association(:notes)
	    expect(assc.macro).to eq :has_many
	  end
end

end
