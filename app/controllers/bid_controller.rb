class BidController < ApplicationController

  def create
    @bid = Bid.new(**bid_params, bid_time: Time.now)
    set_auction_item(@bid)
    respond_to do |format|
      if @bid.save
        format.turbo_stream
        format.html { redirect_to @auction_item, notice: 'Bid was successfully created.' }
      end
    end
  end

  def index
  end

  private
  def bid_params
    params.require(:bid).permit(:auction_item_id, :user_id, :amount)
  end

  def set_auction_item(bid)
    @auction_item = AuctionItem.find(bid.auction_item_id)
  end
  
end
