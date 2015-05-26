require 'minitest/autorun'
require 'minitest/pride'
require 'httparty'
require 'json'
require './conditions_summary.rb'
require './ten_day_forecast.rb'
require './alerts.rb'
require './astronomy.rb'
require './hurricanes.rb'

class ConditionsSummary
  private def get_data
    JSON.parse(File.open("conditions_data.json").read)
  end
end

class TenDayForecast
  private def get_data
    JSON.parse(File.open("ten_day_data.json").read)
  end
end

class Alerts
  private def get_data
    JSON.parse(File.open("alerts_data.json").read)
  end
end

class Astroomy
  private def get_data
    JSON.parse(File.open("astronomy_data.json").read)
  end
end

class Hurricanes
  def initialize
    @data = JSON.parse(File.open("hurricane_data.json").read)
  end
end

class WeatherTest < Minitest::Test

  @@summary = ConditionsSummary.new(27516)
  @@tenday = TenDayForecast.new(27516)
  @@alerts = Alerts.new(70032)
  @@astronomy = Astronomy.new(27516)
  @@hurricanes = Hurricanes.new

  def test_truth
    assert true
  end

  def test_false
    refute false
  end

  def test_summary_zip_instance
    assert_equal 27516, @@summary.zip
  end

  def test_city_state
    summary = ConditionsSummary.new(27516)
    assert_equal "Chapel Hill, NC", summary.city_state
  end

  def test_latitude_and_longitude
    assert_equal "35.91816330, -79.12082672", @@summary.coordinates
  end

  def test_wind
    assert_equal "Wind: Calm", @@summary.wind
  end

  def test_current_weather
    assert_equal "Weather: Partly Cloudy", @@summary.weather
  end

  def test_current_temp
    assert_equal "Temperature: 76.0 F (24.4 C)", @@summary.temp
  end

  def test_humidity
    assert_equal "Humidity: 56%", @@summary.humidity
  end

  def test_time
    assert_equal "Time: Sun, 24 May 2015 19:02:55", @@summary.time
  end

  def test_feels_like
    assert_equal "Feels like: 76.0 F (26 C)", @@summary.feel
  end

  # def test_all_conditions
  #   assert_equal "Success", @@summary.conditions
  # end

  def test_ten_day_zip_instance
    assert_equal 27516, @@tenday.zip
  end

  def test_ten_day_day_method
    assert_equal "Thursday Night", @@tenday.title(7)
  end

  def test_period_forecast
    assert_equal "Scattered thunderstorms during the evening followed by"\
    " occasional showers overnight. Low around 65F. Winds light and variable."\
    " Chance of rain 60%.", @@tenday.forecast(7)
  end

  # def test_all_period_forecasts
  #   assert_equal "Success", @@tenday.forecasts
  # end

  def test_alerts_zip
    assert_equal 70032, @@alerts.zip
  end

  def test_alerts_empty
    refute @@alerts.empty?
  end

  def test_alert_title
    assert_equal "Flash Flood Watch",  @@alerts.title(1)
  end

  def test_alert_message
    assert_equal "\nTornado Watch 219 remains in effect until 500 am CDT for t"\
    "he \nfollowing locations\n\n\nLa \n. Louisiana parishes included are\n\nA"\
    "scension Assumption Avoyelles \nCatahoula Concordia East Baton Rouge \nEa"\
    "st Carroll East Feliciana Franklin \nIberia Iberville Jefferson \nLafayet"\
    "te Lafourche Livingston \nMadison Morehouse Orleans \nPlaquemines Pointe "\
    "Coupee Richland \nSt. Bernard St. Charles St. Helena \nSt. James St. John"\
    " the baptistst. Landry \nSt. Martin St. Mary St. Tammany \nTangipahoa Ten"\
    "sas Terrebonne \nVermilion Washington West Baton Rouge \nWest Carroll Wes"\
    "t Feliciana \n\n\n\n\n", @@alerts.message(0)
  end

  def test_alert_expires
    assert_equal "8:00 AM CDT on May 26, 2015", @@alerts.expires(1)
  end

  # def test_alerts_show_method
  #   assert_equal "Success", @@alerts.show
  # end

  def test_astronomy_zip
    assert_equal 27516, @@astronomy.zip
  end

  def test_astronomy_sunrise
    assert_equal "6:03", @@astronomy.up
  end

  def test_astronomy_sunset
    assert_equal "20:23", @@astronomy.down
  end

  def test_hurricanes_class_exists
    assert_equal Hurricanes, @@hurricanes.class
  end

  def test_hurricane_name
    assert_equal "Invest 91E", @@hurricanes.name(0)
  end

  def test_hurricane_category
    assert_equal "-4", @@hurricanes.category(0)
  end

  def test_wind_speed
    assert_equal "30", @@hurricanes.wind(0)
  end
end
