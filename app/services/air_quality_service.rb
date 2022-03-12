require 'erb'

class AirQualityService
  def self.get_air_quality(city)
    city =  ERB::Util.url_encode(city)
    api_url = "https://api.waqi.info/feed/#{city}/?token=#{ENV["air_quality_api_key"]}"
    Faraday.get(api_url)
  end
end
