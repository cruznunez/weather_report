class ConditionsSummary
  attr_reader :data
  def initialize(zip)
    @data = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")

  end

  def test
    @data["response"]["termsofService"]
  end

end
