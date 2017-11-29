require 'backstage_passes'

describe Backstage_passes do

  it "should increase item quality when sell in date decreases" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)
    backstage_passes = Backstage_passes.new(item)
    backstage_passes.update_quality
    expect(item.quality).to eq (11)
  end

  it "should increase item quality by twice when sell_by date is less than 10" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)
    backstage_passes = Backstage_passes.new(item)
    backstage_passes.update_quality
    expect(item.quality).to eq (12)
  end
  #
  it "should increase item quality by three times when sell_by date is less than 5" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)
    backstage_passes = Backstage_passes.new(item)
    backstage_passes.update_quality
    expect(item.quality).to eq (13)
  end
  #
  it "should not increase item quality to more than 50" do
     item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)
     backstage_passes = Backstage_passes.new(item)
     backstage_passes.update_quality
     expect(item.quality).to eq (50)
 end

  it "item quality should be zero after sell_in date" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)
    backstage_passes = Backstage_passes.new(item)
    backstage_passes.update_quality
    expect(item.quality).to eq (0)
  end

end
