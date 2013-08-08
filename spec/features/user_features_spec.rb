require 'spec_helper'

def create_user(user, pwd)
end

describe 'a user' do

  before(:all) do
    create_user('jsmith', 'password1')
  end

  it 'shoud be able to signup' do
    visit '/signup'

    within '#signup' do
      fill_in 'Username', with: 'newuser'
      fill_in 'Password', with: 'letmein'
      fill_in 'Confirm password', with: 'letmein'
      click_on 'Sign up'
    end

    expect(page).to have_content('Signed in as newuser')
  end

  it 'should be able to login' do
    login('jsmith', 'password1')

    expect(page).to have_content('Signed in as jsmith')
  end

  it 'should be able to logout' do
    login('jsmith', 'password1')
    click_on 'Logout'

    expect(page).to have_content('Logged out')
  end

end