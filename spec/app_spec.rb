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
    let(:mock_purchases_data) {
      [{"user_id"=>"FFWN-1CKR-X4WU-Q44M", "item"=>"Awesome Marble Clock", "spend"=>"69.44"},
        {"user_id"=>"HEI7-W5NW-OO9S-Z382", "item"=>"Synergistic Concrete Pants", "spend"=>"9.87"},
        {"user_id"=>"HEI7-W5NW-OO9S-Z382", "item"=>"Synergistic Concrete Pants", "spend"=>"76.06"},
        {"user_id"=>"BMCS-1VS1-39KR-7OUM", "item"=>"Durable Wool Shoes", "spend"=>"66.35"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Durable Wool Shoes", "spend"=>"31.3"},
        {"user_id"=>"PJ69-9VN5-D5NA-IEB4", "item"=>"Mediocre Wooden Keyboard", "spend"=>"76.0"},
        {"user_id"=>"NIU9-LO98-MZQG-E4RP", "item"=>"Gorgeous Aluminum Plate", "spend"=>"30.84"},
        {"user_id"=>"EIGM-YGNY-BE29-UXXY", "item"=>"Durable Aluminum Bag", "spend"=>"5.2"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Rustic Steel Wallet", "spend"=>"80.34"},
        {"user_id"=>"PJ69-9VN5-D5NA-IEB4", "item"=>"Synergistic Bronze Bottle", "spend"=>"35.55"},
        {"user_id"=>"NGE1-SZL3-4WUU-NWD9", "item"=>"Incredible Linen Pants", "spend"=>"30.78"},
        {"user_id"=>"7IE1-PDJ4-IPH6-8K3L", "item"=>"Gorgeous Steel Computer", "spend"=>"17.75"},
        {"user_id"=>"HEI7-W5NW-OO9S-Z382", "item"=>"Gorgeous Silk Table", "spend"=>"53.43"},
        {"user_id"=>"EIGM-YGNY-BE29-UXXY", "item"=>"Gorgeous Rubber Shoes", "spend"=>"71.43"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Durable Wool Shoes", "spend"=>"31.3"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Durable Wool Shoes", "spend"=>"31.3"}]
    }
    before do
      allow(app).to receive(:purchases_data).and_return(mock_purchases_data)
    end
    it "finds most sold item" do
      expect(app.most_sold).to eq("Durable Wool Shoes")
    end
  end

  describe "most_loyal" do
    let(:app) {App.new}
    let(:mock_purchases_data) {
      [{"user_id"=>"FFWN-1CKR-X4WU-Q44M", "item"=>"Awesome Marble Clock", "spend"=>"69.44"},
        {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Synergistic Concrete Pants", "spend"=>"9.87"},
        {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Synergistic Concrete Pants", "spend"=>"76.06"},
        {"user_id"=>"BMCS-1VS1-39KR-7OUM", "item"=>"Durable Wool Shoes", "spend"=>"66.35"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Durable Wool Shoes", "spend"=>"31.3"},
        {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Mediocre Wooden Keyboard", "spend"=>"76.0"},
        {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Gorgeous Aluminum Plate", "spend"=>"30.84"},
        {"user_id"=>"EIGM-YGNY-BE29-UXXY", "item"=>"Durable Aluminum Bag", "spend"=>"5.2"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Rustic Steel Wallet", "spend"=>"80.34"},
        {"user_id"=>"PJ69-9VN5-D5NA-IEB4", "item"=>"Synergistic Bronze Bottle", "spend"=>"35.55"},
        {"user_id"=>"NGE1-SZL3-4WUU-NWD9", "item"=>"Incredible Linen Pants", "spend"=>"30.78"},
        {"user_id"=>"7IE1-PDJ4-IPH6-8K3L", "item"=>"Gorgeous Steel Computer", "spend"=>"17.75"},
        {"user_id"=>"HEI7-W5NW-OO9S-Z382", "item"=>"Gorgeous Silk Table", "spend"=>"53.43"},
        {"user_id"=>"EIGM-YGNY-BE29-UXXY", "item"=>"Gorgeous Rubber Shoes", "spend"=>"71.43"},
        {"user_id"=>"T8VE-2OW8-A7SF-JZOB", "item"=>"Durable Wool Shoes", "spend"=>"31.3"},
        {"user_id"=>"KZHR-1H35-2IH8-JXYN", "item"=>"Durable Wool Shoes", "spend"=>"31.3"}]
    }

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
end
