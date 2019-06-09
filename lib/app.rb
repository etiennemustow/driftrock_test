require 'json'
require_relative 'api'
require 'pry'

class App
  attr_reader :users_data, :purchases_data, :api
  def initialize
    @api = API.new
    @users_data = api.call("users")
    @purchases_data = api.call("purchases")
  end

  def most_sold
    sold_items = []
    purchases_data.each {|purchase_data| sold_items << purchase_data["item"]}
    most_sold_item = sold_items.max_by { |item| sold_items.count(item)}
    return most_sold_item
  end

  def most_loyal
    users_ids = []
    purchases_data.each {|purchase_data| users_ids << purchase_data["user_id"]}
    most_loyal_id = users_ids.max_by { |id| users_ids.count(id) }
    most_loyal_user_hash = users_data.find{|user| user["id"] == most_loyal_id}
    most_loyal_user = most_loyal_user_hash["email"]
    return most_loyal_user
  end

  def total_spend(email)
    total_spend = 0
    users_purchases =[]
    user = users_data.find{|user| user["email"] == email.to_s}
    purchases_data.each do |d|
      spend = d["spend"].to_f
       total_spend += spend if d["user_id"] == user["id"]
     end
    return total_spend
  end
end

if ARGV[0] == "most_sold"
  app = App.new
  most_sold = app.most_sold
  puts most_sold
elsif ARGV[0] == "most_loyal"
  app = App.new
  most_loyal = app.most_loyal
  puts most_loyal
elsif ARGV[0] == "total_spend"
  app = App.new
  total_spend = app.total_spend(ARGV[1])
  puts total_spend
end
