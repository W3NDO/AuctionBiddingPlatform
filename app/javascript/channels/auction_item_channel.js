import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()
const auctionItems = document.querySelectorAll('.auction-item') // find all auction items.

document.addEventListener("turbo:load", () => {
  auctionItems.forEach( auctionItemElement => { // iterate through all auction items on page and add an event listener for each
    if (auctionItemElement) {
      const auctionItemId = auctionItemElement.dataset.auctionItemId
  
      consumer.subscriptions.create({ channel: "AuctionItemChannel", id: auctionItemId }, {
        received(data) {
          const highestBidElement = document.getElementById(`highest_bid_auction_item_${auctionItemId}`)
          console.log("ID: ", auctionItemId, highestBidElement.innerHTML, data)
          highestBidElement.innerHTML = `${data}`
        }
      })
    }
  })
})