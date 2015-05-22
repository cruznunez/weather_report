require './conditions_summary.rb'

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

def forecast(input)
  puts "forecast"
end

def repeat
  loop do
    print "Wanna go again?(Y/N): "
    input = gets.chomp
    break if input == 'y' || input == 'Y'
    exit if input == 'n' || input == 'N'
    puts
  end
end

welcome
loop do
  zip = input
  forecast(zip)
  repeat
end
