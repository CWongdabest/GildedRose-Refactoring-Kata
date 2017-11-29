require 'aged_brie'

describe Aged_brie do

  class FakeItem
      attr_accessor :sell_in, :quality

      def initialize(name, sell_in, quality)
        @sell_in = sell_in
        @quality = quality
      end
  end

  it "should increase item quality when sell in date decreases" do
    item = FakeItem.new("Aged Brie", 10, 10)
    aged_brie = Aged_brie.new(item)
    aged_brie.update_quality
    expect(item.quality).to eq (11)
  end

  it "should increase item quality twice when sell in date is passed" do
    item = FakeItem.new("Aged Brie", 0, 10)
    aged_brie = Aged_brie.new(item)
    aged_brie.update_quality
    expect(item.quality).to eq (12)
  end

  it "should not increase item quality to more than 50" do
    item = FakeItem.new("Aged Brie", 0, 49)
    aged_brie = Aged_brie.new(item)
    aged_brie.update_quality
    expect(item.quality).to eq (50)
  end


end
