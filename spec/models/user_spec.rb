# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  jti                    :string           not null
#  password               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
