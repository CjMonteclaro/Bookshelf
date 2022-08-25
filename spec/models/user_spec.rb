require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    let(:user1) { create(:user) }
  end
  
  it "is valid with valid attributes" do
    expect(user1).to be_valid
  end
  
  it "is not valid without a password" do 
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without a username" do 
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid
  end
  
  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it 'is not valid if username is not unique' do
    user2 = build(:user)
    user2.username = user1.username
    expect(user2).to_not be_valid
  end

  it 'is not valid if email is not unique' do
    user2 = build(:user)
    user2.email = user1.email
    expect(user2).to_not be_valid
  end
end
