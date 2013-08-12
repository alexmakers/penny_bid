dispatcher = new WebSocketRails('localhost:3000/websocket')

channel = dispatcher.subscribe('bids')
channel.bind 'new', (listing) ->
  $('#listing-' + listing.id + ' .price').text(listing.price)