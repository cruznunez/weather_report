class Alerts
  attr_reader :zip, :data
  def initialize(zip)
    @zip = zip
    @data = get_data
  end

  private def get_data
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/alerts/q/#{@zip}.json")
  end

  def title(alert)
    @data["alerts"][alert]["description"]
  end

  def message(alert)
    @data["alerts"][alert]["message"]
  end

  def expires(alert)
    @data["alerts"][alert]["expires"]
  end

  def empty?
    @data["alerts"].empty?
  end

  def show
    print "ALERTS: "
    if empty?
      puts "No current weather alerts in your area! 😁"
      puts
    else
      num = 0
      @data["alerts"].each do |alert|
        puts
        puts "TITLE: " + title(num)
        puts "EXPIRES: " + expires(num)
        puts "MESSAGE: " + message(num)
        num += 1
      end
    end
    "Success"
  end
end
