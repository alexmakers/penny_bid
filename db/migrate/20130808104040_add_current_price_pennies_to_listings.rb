class AddCurrentPricePenniesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :current_price_pennies, :integer, default: 100
  end
end
