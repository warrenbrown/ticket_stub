require 'rails_helper'

RSpec.feature 'Users can update tickets' do
  before do
    ticket = FactoryGirl.create(:ticket)
    visit '/'
    click_link ticket.name
  end
  scenario 'with valid details' do
    click_link 'Edit'
    fill_in 'Name', with: 'Alicia'
    click_button 'Update Ticket'

    expect(page).to have_content 'Ticket has been updated'
    expect(page).to have_content 'Alicia'
  end

  scenario 'with invalid details' do
    click_link 'Edit'
    fill_in 'Name', with: ''
    click_button 'Update Ticket'
    expect(page).to have_content 'Ticket has not been updated.'
    expect(page).to have_content "Name can't be blank"
  end
end
