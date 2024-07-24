require 'rails_helper'

RSpec.describe "Bids", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/bid/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/bid/index"
      expect(response).to have_http_status(:success)
    end
  end

end
