require 'rails_helper'

RSpec.describe 'Umdzes Home', type: :feature do
  let(:umdze)  { FactoryBot.create :umdze }
  after :each do
    Warden.test_reset!
  end
  describe 'un-authenticated' do
    scenario 'attempts to access umdzes home page is redirected to login' do
      visit umdzes_home_path
      expect(current_path).to eql(new_umdze_session_path)
    end
  end
  describe 'already authenticated' do
    before    { umdze_log_in(umdze) }
    scenario 'gets access to the umdzes homepage' do
      visit umdzes_home_path
      expect(current_path).to eql(umdzes_home_path)
    end
  end
end
