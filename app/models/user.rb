class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :valid_city, if: :city

  def valid_city
    # Passing a blank string to the service throws an error
    city = "A city" if city.blank?
    response = AirQualityService.get_air_quality(self.city)
    status = JSON.parse(response.body)["status"]
    if status == "error"
      errors.add(:city, "#{city} is not available to monitor air quality, please choose a more populous city close to you")
    end
  end
end
