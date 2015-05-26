class ConditionsSummary
  attr_reader :data, :zip
  def initialize(zip)
    @zip = zip
    @data = get_data
  end

  def city_state
    @data["current_observation"]["display_location"]["full"]
  end

  def coordinates
    lat = @data["current_observation"]["display_location"]["latitude"]
    lon = @data["current_observation"]["display_location"]["longitude"]
    "#{lat}, #{lon}"
  end

  def wind
    "Wind: " + @data["current_observation"]["wind_string"]
  end

  def weather
    "Weather: " + @data["current_observation"]["weather"]
  end

  def temp
    "Temperature: " + @data["current_observation"]["temperature_string"]
  end

  def humidity
    "Humidity: " + @data["current_observation"]["relative_humidity"]
  end

  def time
    "Time: " + @data["current_observation"]["local_time_rfc822"][0..-7]
  end

  def feel
    "Feels like: " + @data["current_observation"]["feelslike_string"]
  end

  def conditions
    puts city_state
    puts time
    puts "CURRENT CONDITIONS: "
    puts temp
    puts feel
    puts weather
    puts wind
    puts humidity
    puts

    "Success"
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{@zip}.json")
  end
end
