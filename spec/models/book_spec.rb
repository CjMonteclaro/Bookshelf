# == Schema Information
#
# Table name: books
#
#  id              :bigint           not null, primary key
#  author          :string
#  cover_image_url :string
#  page_count      :integer
#  publisher       :string
#  synopsis        :text
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Book, type: :model do

  before(:all) do
    let(:book1) { create(:book) }
  end
  
  it "is valid with valid attributes" do
    expect(book1).to be_valid
  end
  
  it "is not valid without a title" do 
    book2 = build(:book, title: nil)
    expect(book2).to_not be_valid
  end
  
  it "is not valid without a author" do 
    book2 = build(:book, author: nil)
    expect(book2).to_not be_valid
  end
  
  it "is not valid without a cover_image_url" do 
    book2 = build(:book, cover_image_url: nil)
    expect(book2).to_not be_valid
  end

  it "is not valid without an page_count" do
    book2 = build(:book, page_count: nil)
    expect(book2).to_not be_valid
  end

  it "is not valid without a publisher" do 
    book2 = build(:book, publisher: nil)
    expect(book2).to_not be_valid
  end

  it "is not valid without a synopsis" do 
    book2 = build(:book, synopsis: nil)
    expect(book2).to_not be_valid
  end
end
