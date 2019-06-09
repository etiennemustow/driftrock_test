require 'json'
require_relative 'api'

class App
  attr_reader :users_data, :purchases_data, :api
  def initialize
    @api = API.new
    @users_data = api.call("users")
    @purchases_data = api.call("purchases")
  end

  def most_sold
    data = purchases_data
    sold_items = []
    data.each {|d| sold_items << d["item"]}
    most_sold_item = sold_items.max_by { |i| sold_items.count(i)}
    return most_sold_item
  end
end
