require "api.rb"

RSpec.describe "API" do
  context "on initialisation" do
    it "has an initial url" do
      api = API.new
      expect(api.first_url).to eq("https://driftrock-dev-test.herokuapp.com/")
    end
  end
  context "fetching data" do
    let(:api) { API.new }

    it "returns a working code for initial URL" do
      expect(HTTParty.get(api.first_url + "status").code).to eq(200)
    end

    it "returns data for purchases" do
      expect(api.call("purchases").length).to_not eq(0)
    end

    it "returns data for users" do
      expect(api.call("users").length).to_not eq(0)
    end
  end
end
