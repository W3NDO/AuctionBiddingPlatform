require 'rails_helper'

RSpec.describe "AuctionItems", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/auction_item/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/auction_item/index"
      expect(response).to have_http_status(:success)
    end
  end

end
