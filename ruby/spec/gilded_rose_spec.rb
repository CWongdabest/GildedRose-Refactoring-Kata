require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  describe "#aged_brie?" do
    it "decides if an item in an Aged Brie" do
      items = [Item.new("Aged Brie", 0, 0)]
      gildedrose = GildedRose.new(items)
      expect(gildedrose.aged_brie?(items[0])).to eq true
    end
  end

end
