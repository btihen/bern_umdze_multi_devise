require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  describe "factory functions" do
    it "generates a valid model" do
      model = FactoryBot.build :admin
      expect(model.valid?).to be true
    end
    it "saves a valid user" do
      model = FactoryBot.build :admin
      expect(model.save).to be_truthy
    end
  end

  describe "DB settings" do
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_column(:admins_name) }
    it { is_expected.to have_db_column(:encrypted_password) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:admins_name) }
  end

end
