class HomeController < ApplicationController
  def index
    @auction_items = AuctionItem.includes(:bids).all.sort_by &:created_at
    
  end
end
