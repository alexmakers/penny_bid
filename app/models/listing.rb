class Listing < ActiveRecord::Base

  def bid!
    self.current_price_pennies += 1
    save
  end
end
