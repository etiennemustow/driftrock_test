require "app.rb"

RSpec.describe "App" do
  context "on initialisation" do
    let(:app) {App.new}
    it "has an api attribute" do
      expect(app.api.class).to eq(API)
    end
    it "has a users_data attribute" do
      expect(app.users_data.length).to_not eq(0)
    end
    it "has a purchases_data attribute" do
      expect(app.purchases_data.length).to_not eq(0)
    end
  end

  describe "most_sold" do
    let(:app) {App.new}
    let(:mock_purchases_data) { MOCK_PURCHASES_DATA }

    before do
      allow(app).to receive(:purchases_data).and_return(mock_purchases_data)
    end
    it "finds most sold item" do
      expect(app.most_sold).to eq("Durable Wool Shoes")
    end
  end

  describe "most_loyal" do
    let(:app) {App.new}
    let(:mock_purchases_data) { MOCK_PURCHASES_DATA }

    let(:mock_users_data){ MOCK_USERS_DATA }
    before do
      allow(app).to receive(:purchases_data).and_return(mock_purchases_data)
      allow(app).to receive(:users_data).and_return(mock_users_data)
    end
    it "finds the most loyal user" do
      expect(app.most_loyal).to eq("schimmel_quincy@ernser.io")
    end
  end

  describe "total_spend" do
    let(:app) {App.new}
    let(:mock_purchases_data) { MOCK_PURCHASES_DATA }

    let(:mock_users_data){ MOCK_USERS_DATA }
    before do
      allow(app).to receive(:purchases_data).and_return(mock_purchases_data)
      allow(app).to receive(:users_data).and_return(mock_users_data)
    end
    it "returns total spend for a user" do
      expect(app.total_spend("terry_henry@doyle.io")).to eq(84.73)
    end
  end
end
