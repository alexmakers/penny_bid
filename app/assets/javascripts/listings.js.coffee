$ ->
  $('.listing').on 'ajax:success', (e, data) ->
    $(@).find('.price').html data.price

