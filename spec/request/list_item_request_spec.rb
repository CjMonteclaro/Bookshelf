require 'rails_helper'

RSpec.describe ListItem, type: :request do
 
  before(:all) do
    @list_item = create(:list_item)
  end

  it "return all list items" do
    get '/api/list_items'

    expect(response).to have_http_status(:ok)
  end

  it "return a list item" do
    get "/api/list_items/#{@list_item.id}"

    expect(response).to have_http_status(:ok)
  end

  it "create a list item" do
    post '/api/list_items', params: { book_id: @list_item.book_id, owner_id: @list_item.owner_id }

    expect(response).to have_http_status(:created)
  end

  it "create a list item" do
    delete "/api/list_items/#{@list_item.id}"

    expect(response).to have_http_status(:ok)
  end

end

