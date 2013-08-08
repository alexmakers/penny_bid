require 'spec_helper'

def create_user(user, pwd)
end

describe 'a logged in user' do

  before(:all) do
    create_user('jsmith', 'password1')
    login('jsmith', 'password1')

    @listing = Listing.create(title: 'Macbook Air', price: 1.00)
    visit '/'

    within ".item:first" do
      click_on 'Bid'
    end
  end

  it 'should win the listing, if they were the last bidder when the timer runs out' do
    @lisiting.time_remaining = 0
    visit listing_path(@listing)

    expect(page).to have_content 'You won!'
  end

end