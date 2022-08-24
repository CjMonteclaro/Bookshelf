require 'rails_helper'

RSpec.describe ListItem, type: :model do
  before(:all) do
    @list_item1 = create(:list_item)
  end
  
  it "is valid with valid attributes" do
    expect(@list_item1).to be_valid
  end
  
  it "is not valid without a book_id" do 
    list_item2 = build(:list_item, book_id: nil)
    expect(list_item2).to_not be_valid
  end
  
  it "is not valid without a owner_id" do 
    list_item2 = build(:list_item, owner_id: nil)
    expect(list_item2).to_not be_valid
  end
  
  it "is not valid without an rating" do
    list_item2 = build(:list_item, rating: nil)
    expect(list_item2).to_not be_valid
  end

  it "is not valid without a notes" do 
    list_item2 = build(:list_item, notes: nil)
    expect(list_item2).to_not be_valid
  end
  
  it "is not valid without a start_date" do 
    list_item2 = build(:list_item, start_date: nil)
    expect(list_item2).to_not be_valid
  end
  
  it "is not valid without an finish_date" do
    list_item2 = build(:list_item, finish_date: nil)
    expect(list_item2).to_not be_valid
  end
end