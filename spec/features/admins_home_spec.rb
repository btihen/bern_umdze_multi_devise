require 'rails_helper'

RSpec.describe 'Admins Home', type: :feature do
  let(:admin)  { FactoryBot.create :admin }
  after :each do
    Warden.test_reset!
  end
  describe 'un-authenticated' do
    scenario 'attempts to access admins home page is redirected to user login' do
      visit admins_home_path
      expect(current_path).to eql(new_admin_session_path)
    end
  end
  describe 'already authenticated' do
    before    { admin_log_in(admin) }
    scenario 'gets access to the user homepage' do
      visit admins_home_path
      expect(current_path).to eql(admins_home_path)
    end
  end
end
