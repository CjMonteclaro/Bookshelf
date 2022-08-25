require 'rails_helper'

RSpec.describe "GET /api/list_item_requests", type: :request do
 
  before(:all) do
    let(:user1) { create(:user) }
    sign_in(user1)

    let(:list_item1) { create(:list_item) }

  end

  it "create a list item" do
    post '/api/list_items', params: { book_id: list_item1.book_id, owner_id: list_item1.owner_id }

    expect(response).to have_http_status(:created)
  end

end

