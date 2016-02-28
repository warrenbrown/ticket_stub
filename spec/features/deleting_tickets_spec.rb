require 'rails_helper'

RSpec.feature 'Users can delete tickets' do
  scenario 'Successfully' do
    ticket= FactoryGirl.create(:ticket)
    visit '/'

    click_link ticket.name
    click_link 'Delete'

    expect(page).to have_content 'Ticket has been deleted.'
    expect(page).to have_no_content ticket.name
  end
end
