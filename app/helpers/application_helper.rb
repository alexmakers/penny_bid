module ApplicationHelper

  def price_pounds(pennies)
    number_to_currency(pennies / 100.0, unit: '£')
  end
  
end
