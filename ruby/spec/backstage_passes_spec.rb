require 'backstage_passes'

describe Backstage_passes do

  it "should increase item quality when sell in date decreases" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)
    backstage_passes = Backstage_passes.new(item)
    backstage_passes.update_quality
    expect(item.quality).to eq (11)
  end

  # it "should increase item quality by twice when sell_by date is less than 10" do
  #   items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
  #   gildedrose = GildedRose.new(items)
  #   gildedrose.update_quality
  #   expect(items[0].quality).to eq (12)
  # end
  #
  # it "should increase item quality by three times when sell_by date is less than 5" do
  #   items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
  #   gildedrose = GildedRose.new(items)
  #   gildedrose.update_quality
  #   expect(items[0].quality).to eq (13)
  # end
  #
  # it "should not increase item quality to more than 50" do
  #   items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
  #   gildedrose = GildedRose.new(items)
  #   gildedrose.update_quality
  #   expect(items[0].quality).to eq (50)
  # end
  #
  # it "item quality should be zero after sell_in date" do
  #   items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
  #   gildedrose = GildedRose.new(items)
  #   gildedrose.update_quality
  #   expect(items[0].quality).to eq (0)
  # end

end
