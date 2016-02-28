require 'rails_helper'

RSpec.feature 'Users can view tickets' do
  scenario 'all details'  do
    ticket = FactoryGirl.create(:ticket)
    visit '/'
    click_link ticket.name

    expect(page.current_url).to eq ticket_url(ticket)
  end
end
