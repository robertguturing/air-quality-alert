require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    describe "#valid_city" do
      context "service returns ok" do
        before do
          response = double
          allow(response).to receive(:body).and_return(
            {
              status: "ok"
            }.to_json
          )
          allow(AirQualityService).to receive(:get_air_quality).and_return(response)
        end

        it "is a valid city" do
          user = User.create(email: "rob@example.com", password: "password", password_confirmation: "password", city: "Denver")
          expect(user.valid?).to eq(true)
        end
      end

      context "service returns error" do
        before do
          response = double
          allow(response).to receive(:body).and_return(
            {
              status: "error"
            }.to_json
          )
          allow(AirQualityService).to receive(:get_air_quality).and_return(response)
        end

        it "is not a valid city" do
          user = User.create(email: "rob@example.com", password: "password", password_confirmation: "password", city: "yoville")
        end
      end
    end
  end
end
