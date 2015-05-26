require './conditions_summary.rb'
require './ten_day_forecast.rb'
require './alerts.rb'
require './astronomy.rb'
require './hurricanes.rb'
require 'httparty'

def welcome
  puts "FORECAST!!!!"
  puts
end

def input
  print "Enter zip code: "
  input = gets.chomp
  puts
  while (input.length != 5) || (input[/[^\d]/] != nil)
    puts "Only a combination of five numbers are accepted. Try again."
    puts
    print "Enter zip code: "
    input = gets.chomp
    puts
  end
  return input
end

def forecast(zip)
  now = ConditionsSummary.new(zip)
  now.conditions
  suntimes = Astronomy.new(zip)
  suntimes.show
  ten_day = TenDayForecast.new(zip)
  ten_day.forecasts
  alerts = Alerts.new(zip)
  alerts.show
  hurricanes = Hurricanes.new
  hurricanes.show
end

def repeat
  loop do
    puts
    print "Wanna go again?(Y/N): "
    input = gets.chomp
    puts
    break if input == 'y' || input == 'Y'
    exit if input == 'n' || input == 'N'
  end
end

welcome
loop do
  zip = input
  forecast(zip)
  repeat
end
