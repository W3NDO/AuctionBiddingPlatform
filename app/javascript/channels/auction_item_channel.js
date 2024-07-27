// import consumer from "channels/consumer"

// consumer.subscriptions.create("AuctionItemChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });
import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()
const auctionItems = document.querySelectorAll('.auction-item')

document.addEventListener("turbo:load", () => {
  auctionItems.forEach( auctionItemElement => {
    if (auctionItemElement) {
      const auctionItemId = auctionItemElement.dataset.auctionItemId
  
      consumer.subscriptions.create({ channel: "AuctionItemChannel", id: auctionItemId }, {
        received(data) {
          const highestBidElement = document.getElementById(`highest_bid_auction_item_${auctionItemId}`)
          console.log("Highest bid elem pre", highestBidElement.innerHTML)
          highestBidElement.innerHTML = `${data}`
          console.log("Highest bid elem post", highestBidElement.innerHTML)
        }
      })
    }
  })
})