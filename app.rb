require 'httparty'
require 'json'

def most_sold
  url = "https://driftrock-dev-test.herokuapp.com/purchases"
  response = HTTParty.get(url)
  obj = JSON.parse(response.body)
  data = obj["data"]
  sold_items = []
  data.each {|d| sold_items << d["item"]}
  most_sold_item = sold_items.max_by { |i| sold_items.count(i)}
  print most_sold_item
end

most_sold
