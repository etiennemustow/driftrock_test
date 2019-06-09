require 'httparty'
require 'json'

class API
  attr_reader :first_url

  def initialize
    @first_url = "https://driftrock-dev-test.herokuapp.com/"
  end

  def call(end_point)
    url = first_url + end_point
    response = HTTParty.get(url)
    json_response = JSON.parse(response.body)
    results = json_response["data"]
    return results
  end
end
