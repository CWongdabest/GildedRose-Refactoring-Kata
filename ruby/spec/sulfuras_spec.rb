require 'sulfuras'


describe Sulfuras do

  class FakeItem
      attr_accessor :name, :sell_in, :quality

      def initialize(name, sell_in, quality)
        @name = name 
        @sell_in = sell_in
        @quality = quality
      end
  end


  it "should not increase item quality and sell in date of Sulfuras" do
    item = FakeItem.new("Sulfuras, Hand of Ragnaros", 10, 10)
    sulfuras = Sulfuras.new(item)
    sulfuras.update_quality
    expect(item.quality).to eq (10)
  end

  it "should not increase item quality and sell in date of Sulfuras" do
    item = FakeItem.new("Sulfuras, Hand of Ragnaros", 10, 10)
    sulfuras = Sulfuras.new(item)
    sulfuras.update_quality
    expect(item.sell_in).to eq (10)
  end

end
