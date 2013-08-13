dispatcher = new Pusher('a520f51e142c6dea8168', { cluster: 'eu' })

channel = dispatcher.subscribe('bids')
channel.bind 'new', (listing) ->
  $('#listing-' + listing.id + ' .price').text(listing.price)