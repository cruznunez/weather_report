class Hurricanes
  attr_reader :zip, :data

  def initialize
    @data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/currenthurricane/view.json")
  end


  def name(num)
    @data["currenthurricane"][num]["stormInfo"]["stormName_Nice"]
  end

  def category(num)
    @data["currenthurricane"][num]["Current"]["SaffirSimpsonCategory"].to_s
  end

  def wind(num)
    @data["currenthurricane"][num]["Current"]["WindSpeed"]["Mph"].to_s

  end

  def show
    puts "CURRENT US HURRICANES: "

    num = 0
    @data["currenthurricane"].each do |alert|
      puts "Name: " + name(num)
      puts "Category (-5 is small, 5 is huge): #{category(num)}"
      puts "Wind: #{wind(num)} mph"
      puts
      num += 1
    end
  end

end
