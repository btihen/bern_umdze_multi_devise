require 'rails_helper'

RSpec.describe "Umdzes::Homes", type: :request do

  let(:umdze)   { FactoryBot.create :umdze }

  describe "GET /index" do

    context "NOT logged in" do

      after do
        sign_out umdze
      end

      it "home as '/umdzes' page is NOT accessible" do
        get "/umdzes"
        expect(response).to have_http_status(:redirect)
        # to login
      end
      it "home as 'umdzes_home_path' page is NOT accessible" do
        get umdzes_home_path
        expect(response).to have_http_status(:redirect)
      end
      it "home as 'auth_umdze_root_path' page is NOT accessible" do
        get auth_umdze_root_path
        expect(response).to have_http_status(:success)
        # here we need page match for different root routes
      end
    end

    context "logged in" do
      before do
        sign_in umdze
      end
      after do
        sign_out umdze
      end
      it "home as '/umdzes' page is accessible" do
        get "/umdzes"
        expect(response).to have_http_status(:success)
      end
      it "home as 'umdzes_home_path' page is accessible" do
        get umdzes_home_path
        expect(response).to have_http_status(:success)
      end
      it "home as 'auth_umdze_root_path' page is accessible" do
        get auth_umdze_root_path
        expect(response).to have_http_status(:success)
      end
    end

  end

end
