require 'rails_helper'

RSpec.describe User, type: :model do
  
  

  subject{described_class.new(first_name:'joseph', last_name:'su',user_name:'jvsu',email:'joe1@yahoo.com',password:"aaaaaaaa")}

  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end

  it  "is invalid if first_name is blank" do 
    subject.first_name =''
    expect(subject).to be_invalid
  end


  it  "is invalid if last_name is blank" do 
    subject.last_name =''
    expect(subject).to be_invalid
  end


  it  "is invalid if user_name is blank" do 
    subject.user_name =''
    expect(subject).to be_invalid
  end


  it  "is invalid if email is blank" do 
    subject.email =''
    expect(subject).to be_invalid
  end

  it "is invalid if email is the not valid format" do 
    addresses = %w[joe@ joe joe.com joe@baz_ray.com]
    addresses.each do |a|
      subject.email = a
     expect(subject).to be_invalid
    end
  end


  it "is not valid if an email already exists" do
 		user1 = User.new(first_name:'joseph', last_name:'su', user_name:'jvsu',email:'joe2@yahoo.com', password:'aaaaaaaa').save
  	user2 = User.new(first_name:'dave', last_name:'su', user_name:'cray',email:'joe2@yahoo.com', password:'aaaaaaaa')
  	expect(user2).to be_invalid
  end

  it "is not valid if password is blank" do 
    subject.password_digest=''
    expect(subject).to be_invalid
  end

  it "is not valid if password is less than 6 characters" do 
    subject.password = "abc"
    expect(subject).to be_invalid
  end


describe "Associations" do 
  it "has many groups" do 
    assc = described_class.reflect_on_association(:groups)
    expect(assc.macro).to eq :has_many
  end

  it "has many notes" do 
    assc = described_class.reflect_on_association(:notes)
    expect(assc.macro).to eq :has_many
  end

  it "has many collections" do 
    assc = described_class.reflect_on_association(:collections)
    expect(assc.macro).to eq :has_many
  end

  it "has many papers" do 
    assc = described_class.reflect_on_association(:papers)
    expect(assc.macro).to eq :has_many
  end

 it "has many saves" do 
    assc = described_class.reflect_on_association(:saves)
    expect(assc.macro).to eq :has_many
  end


 it "has many your_tags" do 
    assc = described_class.reflect_on_association(:your_tags)
    expect(assc.macro).to eq :has_many
  end
end




end
