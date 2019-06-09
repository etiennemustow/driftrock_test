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

    let(:mock_users_data){
      [{"id" => "KZHR-1H35-2IH8-JXYN","first_name"=> "Quincy","last_name"=> "Schimmel","phone"=> "186.301.6921 x948","email"=> "schimmel_quincy@ernser.io"},
        {"id"=> "S27G-8UMJ-LDSL-UOPN","first_name"=> "Henry","last_name"=> "Terry","phone"=> "636-387-6074 x690","email"=> "terry_henry@doyle.io"},
        {"id"=> "HTNF-7RJY-YFCU-GUN2","first_name"=> "Tierra","last_name"=> "Langosh","phone"=> "570-113-3234 x7287","email"=> "langosh.tierra@erdman.co"},
        {"id"=> "ZZLB-4HCN-OA3N-LGWB","first_name"=> "Jack","last_name"=> "Lakin","phone"=> "(620) 104-0175","email"=> "jack_lakin@rodriguezschuppe.io"}]
    }
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
