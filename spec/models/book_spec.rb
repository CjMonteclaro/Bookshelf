require 'rails_helper'

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


require 'rails_helper'

RSpec.describe Book, type: :model do

  before(:all) do
    @book1 = create(:book)
  end
  
  it "is valid with valid attributes" do
    expect(@book1).to be_valid
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

  it "is not valid without an pageCount" do
    book2 = build(:book, pageCount: nil)
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
