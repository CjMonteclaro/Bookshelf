require 'rails_helper'

RSpec.describe "GET /api/list_item_requests", type: :request do
 
  before(:all) do
    let(:user1) { create(:user) }
    sign_in(user1)

    let(:list_item1) { create(:list_item) }

  end

  it "return all list items" do
    get '/api/list_items'

    expect(response).to have_http_status(:ok)
  end

  it "return a list item" do
    get "/api/list_items/#{list_item1.id}"

    expect(response).to have_http_status(:ok)
  end

end

