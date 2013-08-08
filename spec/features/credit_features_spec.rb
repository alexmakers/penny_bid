require 'spec_helper'

def create_user_with_no_credits
end

describe 'credits' do

  before(:all) { @user = create_user_with_no_credits }

  it 'can be purchased with a valid credit card' do
    visit '/credits/add?amount=100'

    within '#payment_info' do
      fill_in 'Card number', with: '4111-1111-1111-1111'
      fill_in 'Cardholder name', with: 'John Smith'
      fill_in 'CCV', with: '123'
      click_on 'Purchase'
    end

    expect(@user.credits).to eq(100)
  end

end