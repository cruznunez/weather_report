require "httparty"


#MASON
page = HTTParty.get("https://api.github.com/users/masonfmatthews/events")
# body = page.body
p page[0]
p page[0]["id"]
p page.map{|x| x["id"]}
p page.map{|x| x["repo"]["name"]}

page = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/CA/San_Francisco.json")
