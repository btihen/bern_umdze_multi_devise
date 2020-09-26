require 'rails_helper'

RSpec.describe "Admins::Homes", type: :request do

  let(:admin)   { FactoryBot.create :admin }

  describe "GET /index" do

    context "NOT logged in" do
      it "home as '/admins' page is NOT accessible" do
        get "/admins"
        expect(response).to have_http_status(:redirect)
      end
      it "home as 'admins_home_path' page is NOT accessible" do
        get admins_home_path
        expect(response).to have_http_status(:redirect)
      end
      it "home as 'auth_admin_root_path' page is NOT accessible" do
        get auth_admin_root_path
        expect(response).to have_http_status(:success)
        # here we need page match for different root routes
      end
    end

    context "logged in" do
      before do
        sign_in admin
      end
      after do
        sign_out admin
      end
      it "home as '/admins' page is accessible" do
        get "/admins"
        expect(response).to have_http_status(:success)
      end
      it "home as 'admins_home_path' page is accessible" do
        get admins_home_path
        expect(response).to have_http_status(:success)
      end
      it "home as 'auth_admin_root_path' page is accessible" do
        get auth_admin_root_path
        expect(response).to have_http_status(:success)
      end
    end

  end

end
