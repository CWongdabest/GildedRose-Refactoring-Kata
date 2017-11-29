require 'sulfuras'

describe Sulfuras do

  it "should not increase item quality and sell in date of Sulfuras" do
    item = Item.new("Sulfuras, Hand of Ragnaros", 10, 10)
    sulfuras = Sulfuras.new(item)
    sulfuras.update_quality
    expect(item.quality).to eq (10)
  end

  it "should not increase item quality and sell in date of Sulfuras" do
    item = Item.new("Sulfuras, Hand of Ragnaros", 10, 10)
    sulfuras = Sulfuras.new(item)
    sulfuras.update_quality
    expect(item.sell_in).to eq (10)
  end

end
