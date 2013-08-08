require 'spec_helper'

feature 'bidding on a listing' do

  let!(:user) { create(:user) }
  let!(:listing) { create(:listing_macbook) }
  
  background do
    login(user)
  end

  describe 'shoud be able to bid' do

    before(:each) do
      visit '/'

      within ".item:first" do
        click_on 'Bid'
      end
    end

    it 'increment the price by one penny' do
      expect(page).to have_css('.price', text: '$1.01')
    end

    it 'increment the time by 10 seconds' do
      # we'll need to know more about our implementation before
      # we can write a meaningful test
      pending
    end

  end

end