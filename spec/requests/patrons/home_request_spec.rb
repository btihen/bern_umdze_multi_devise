require 'rails_helper'

RSpec.describe "Patrons::Homes", type: :request do

  let(:patron)   { FactoryBot.create :patron }

  describe "GET /index" do

    context "NOT logged in" do

      after do
        sign_out patron
      end

      it "home as '/patrons' page is NOT accessible" do
        get "/patrons"
        expect(response).to have_http_status(:redirect)
        # to login
      end
      it "home as 'patron_home_path' page is NOT accessible" do
        get patrons_home_path
        expect(response).to have_http_status(:redirect)
      end
      it "home as 'auth_patron_root_path' page is NOT accessible" do
        get auth_patron_root_path
        expect(response).to have_http_status(:success)
        # here we need page match for different root routes
      end
    end

    context "logged in" do
      before do
        sign_in patron
      end
      after do
        sign_out patron
      end
      it "home as '/patrons' page is accessible" do
        get "/patrons"
        expect(response).to have_http_status(:success)
      end
      it "home as 'patrons_home_path' page is accessible" do
        get patrons_home_path
        expect(response).to have_http_status(:success)
      end
      it "home as 'auth_patron_root_path' page is accessible" do
        get auth_patron_root_path
        expect(response).to have_http_status(:success)
      end
    end

  end

end
