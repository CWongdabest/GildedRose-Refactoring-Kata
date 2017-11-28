require 'gilded_rose'

describe GildedRose do


  describe "#update_quality" do
    context "normal items" do
      before(:each) do
        @items = [Item.new("foo", 10, 10)]
        gildedrose = GildedRose.new(@items)
        gildedrose.update_quality
      end

      it "does not change the name" do
        expect(@items[0].name).to eq "foo"
      end

      it "decreases item quality by one for every update unless it's Aged Brie, Backstaged passes, or conjure items" do
        expect(@items[0].quality).to eq (9)
      end

      it "decreases item sell_in date by one for every update unless it's Aged Brie, Backstaged passes, or conjure items" do
        expect(@items[0].sell_in).to eq (9)
      end
    end

    context "normal items- edge cases" do
      it "should not decrease item quality to less than zero" do
        items = [Item.new("foo", 10, 10)]
        gildedrose = GildedRose.new(items)

        11.times do |n|
          gildedrose.update_quality
        end
        expect(items[0].quality).to eq (0)
      end
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
