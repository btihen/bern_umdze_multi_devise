require 'rails_helper'

RSpec.describe 'Patrons Home', type: :feature do
  let(:patron)  { FactoryBot.create :patron }
  after :each do
    Warden.test_reset!
  end
  describe 'un-authenticated' do
    scenario 'attempts to access patrons home page is redirected to user login' do
      visit patrons_home_path
      expect(current_path).to eql(new_patron_session_path)
    end
  end
  describe 'already authenticated' do
    before    { patron_log_in(patron) }
    scenario 'gets access to the user homepage' do
      visit patrons_home_path
      expect(current_path).to eql(patrons_home_path)
    end
  end
end
