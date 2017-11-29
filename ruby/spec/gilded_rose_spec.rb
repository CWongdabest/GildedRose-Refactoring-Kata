require 'gilded_rose'

describe GildedRose do



  describe "#update_quality" do


    context "normal items" do


        class FakeItem
            attr_accessor :name, :sell_in, :quality

            def initialize(name, sell_in, quality)
              @name = name
              @sell_in = sell_in
              @quality = quality
            end

        end

      before(:each) do
        @items = [FakeItem.new("foo", 1, 10)]
        @gildedrose = GildedRose.new(@items)
        @gildedrose.update_quality
      end

      it "does not change the name" do
        p @items
        expect(@items[0].name).to eq "foo"
      end

      it "decreases item quality by one for every update unless it's Aged Brie, Backstaged passes, or conjure items" do
        expect(@items[0].quality).to eq (9)
      end

      it "decreases item sell_in date by one for every update unless it's Aged Brie, Backstaged passes, or conjure items" do
        expect(@items[0].sell_in).to eq (0)
      end

      it "decreases item quality date by two for every update after sell_in date unless it's Aged Brie, Backstaged passes, or conjure items" do
        @gildedrose.update_quality
        expect(@items[0].quality).to eq (7)
      end
    end

    context "normal items- edge cases" do
      it "should not decrease item quality to less than zero" do
        items = [FakeItem.new("foo", 10, 10)]
        gildedrose = GildedRose.new(items)

        11.times do |n|
          gildedrose.update_quality
        end
        expect(items[0].quality).to eq (0)
      end
    end

    context "Sulfuras" do
      it "should not increase item quality and sell in date of Sulfuras" do
        items = [FakeItem.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        gildedrose = GildedRose.new(items)
        gildedrose.update_quality
        expect(items[0].quality).to eq (10)
      end

      it "should not increase item quality and sell in date of Sulfuras" do
        items = [FakeItem.new("Sulfuras, Hand of Ragnaros", 10, 10)]
        gildedrose = GildedRose.new(items)
        gildedrose.update_quality
        expect(items[0].sell_in).to eq (10)
      end
    end


    context "Aged Brie" do
      it "should increase item quality when sell in date decreases" do
        items = [FakeItem.new("Aged Brie", 10, 10)]
        gildedrose = GildedRose.new(items)
        gildedrose.update_quality
        expect(items[0].quality).to eq (11)
      end

      it "should increase item quality twice when sell in date is passed" do
        items = [FakeItem.new("Aged Brie", 0, 10)]
        gildedrose = GildedRose.new(items)
        gildedrose.update_quality
        expect(items[0].quality).to eq (12)
      end

      it "should not increase item quality to more than 50" do
        items = [FakeItem.new("Aged Brie", 10, 50)]
        gildedrose = GildedRose.new(items)
        gildedrose.update_quality
        expect(items[0].quality).to eq (50)
      end
    end

      context "Backstage passes" do
        it "should increase item quality when sell in date decreases" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 10)]
          gildedrose = GildedRose.new(items)
          gildedrose.update_quality
          expect(items[0].quality).to eq (11)
        end

        it "should increase item quality by twice when sell_by date is less than 10" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
          gildedrose = GildedRose.new(items)
          gildedrose.update_quality
          expect(items[0].quality).to eq (12)
        end

        it "should increase item quality by three times when sell_by date is less than 5" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
          gildedrose = GildedRose.new(items)
          gildedrose.update_quality
          expect(items[0].quality).to eq (13)
        end

        it "should not increase item quality to more than 50" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
          gildedrose = GildedRose.new(items)
          gildedrose.update_quality
          expect(items[0].quality).to eq (50)
        end

        it "item quality should be zero after sell_in date" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 50)]
          gildedrose = GildedRose.new(items)
          gildedrose.update_quality
          expect(items[0].quality).to eq (0)
        end
    end

  end



end
