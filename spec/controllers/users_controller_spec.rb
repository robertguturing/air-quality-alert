require 'rails_helper'

RSpec.describe UsersController do
  describe "GET show" do
    before do
      response = double
      allow(response).to receive(:body).and_return(
        {
          status: "ok",
          data: { "aqi": 45 }
        }.to_json
      )
      allow(AirQualityService).to receive(:get_air_quality).and_return(response)
    end

    it "allows access if authorized"  do
      user = User.create(email: "word@example.com", password: "password", password_confirmation: "password", city: "Denver")
      sign_in(user)
      get :show, params: { id: user.id }

      expect(response).to have_http_status(:ok)
    end

    it "does not allow access if not authorized" do
      user1 = User.create(email: "word@example.com", password: "password", password_confirmation: "password", air_quality_threshold: 152, city: "Denver")
      user2 = User.create(email: "fun@example.com", password: "password", password_confirmation: "password", city: "Denver")
      sign_in(user1)
      get :show, params: { id: user2.id }

      expect(response).to have_http_status(:redirect)
    end
  end
end

