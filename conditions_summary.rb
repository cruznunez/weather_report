class ConditionsSummary
  attr_reader :data, :zip
  def initialize(zip)
    @zip = zip
    @data = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def test
    @data["response"]["termsofService"]
  end

  def location
    city_state = @data["display_location"]["full"]
  end
end
