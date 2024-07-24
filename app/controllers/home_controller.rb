class HomeController < ApplicationController
  def index
    @auction_items = AuctionItem.all
    
  end
end
