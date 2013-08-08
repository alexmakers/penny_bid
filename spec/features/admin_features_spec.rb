require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'an administrator' do

  before(:all) do
    @admin = create(:admin)
  end

  it 'can log in' do
    visit '/admin/login'

    within '#new_admin' do
      fill_in 'Username', with: 'admin'
      fill_in 'Password', with: 'password1'
      click_on 'Sign in'
    end

    expect(page).to have_css('.notice', text: 'Signed in successfully.')
  end

  context 'logged out' do

    it "can't see the new listing form" do
      visit '/listings/new'
      expect(current_path).to eq('/listings')
    end

  end

  context 'logged in' do

    before(:all) { login_as(@admin, scope: :admin) }

    it 'can create a new listing on the homepage' do

      visit '/listings/new'

      within '#new_listing' do
        fill_in 'listing_title', with: 'Macbook Pro'
        fill_in 'listing_description', with: 'Made by Apple'
        click_on 'Create'
      end

      visit '/'

      expect(page).to have_css('h2', text: 'Macbook Pro')
      expect(page).to have_content('Made by Apple')
    end

  end

end