class ConditionsSummary
  def initialize(zip)
    @data = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")

  end


end
