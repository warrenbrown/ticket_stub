require 'rails_helper'

RSpec.feature 'Users can create tickets' do
  before do
    visit '/'
    click_link 'New Ticket'
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Warren Brown'
    fill_in 'Seat number', with:'14A'
    fill_in 'Address', with: '19547 Fletcher Way Dr Houston Tx 77073'
    fill_in 'Price paid', with: 60.50
    fill_in 'Email address', with: 'admin@example.com'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has been created.'
  end
  scenario 'with invalid attriutes' do
    fill_in 'Name', with: ''

    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end
