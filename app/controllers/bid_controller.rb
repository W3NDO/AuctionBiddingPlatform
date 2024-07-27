class BidController < ApplicationController

  def create
    @bid = Bid.new(**bid_params, bid_time: Time.now)
    set_auction_item(@bid)
    
    
    if @bid.save
      AuctionItemChannel.broadcast_to( 
        @auction_item,
        turbo_stream.update("highest_bid_auction_item_#{@auction_item.id}",
          partial: "bid/highest_bid", locals: { auction_item: @auction_item }
        )
      )

      respond_to do |format|
        # format.turbo_stream
        format.html { redirect_to root_path, notice: 'Bid was successfully created.' }
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
