require 'httparty'

class ActiveHurricanes

  def initialize(zipcode)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/currenthurricane/q/#{zipcode}.json")
  end

  def active_hurricanes
    hurricane_array = []
    @response["currenthurricane"].each do |h|
      hurricane_array << h["stormInfo"]["stormName_Nice"]
    end
    hurricane_array
  end
end
