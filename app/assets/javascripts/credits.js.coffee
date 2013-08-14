$ ->
  $('#buy-credits').on 'click', ->
    token = (res) ->
      $input = $('<input type=hidden name=stripeToken />').val(res.id)
      $('form').append($input).submit()

    StripeCheckout.open {
      key:         'pk_test_d5NRd9AFQW9o97brD73fq1UU',
      address:     false,
      amount:      $('#amount').val(),
      currency:    'gbp',
      name:        $('#amount option:selected').text(),
      description: 'For bidding on auctions',
      panelLabel:  'Checkout',
      token:       token
    }

    return false