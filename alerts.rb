require 'httparty'

class Alerts

  def initialize(zipcode)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/alerts/q/#{zipcode}.json")
  end

  def alerts?
    alerts_array = []
    return "There are no alerts in this area." if @response["alerts"].empty?
    @response["alerts"].each do |a|
      alerts_array << [a["description"],a["expires"]]
    end
    return alerts_array
  end
end
