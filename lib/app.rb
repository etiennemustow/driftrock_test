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
    purchases_data.each {|d| sold_items << d["item"]}
    most_sold_item = sold_items.max_by { |i| sold_items.count(i)}
    return most_sold_item
  end

  def most_loyal
    users_ids = []
    purchases_data.each {|d| users_ids << d["user_id"]}
    most_loyal_id = users_ids.max_by { |id| users_ids.count(id) }
    most_loyal_user_hash = users_data.find{|user| user["id"] == most_loyal_id}
    most_loyal_user = most_loyal_user_hash["email"]
    return most_loyal_user
  end
end
