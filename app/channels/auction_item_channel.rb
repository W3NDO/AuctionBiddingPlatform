class AuctionItemChannel < ApplicationCable::Channel
  def subscribed
    auction_item = AuctionItem.find(params[:id])
    stream_for auction_item
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
