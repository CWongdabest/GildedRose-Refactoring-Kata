require 'conjured'

describe Conjured do

  class FakeItem
      attr_accessor :name, :sell_in, :quality

      def initialize(name, sell_in, quality)
        @name = name
        @sell_in = sell_in
        @quality = quality
      end

  end

  context "normal items" do
    before(:each) do
      @item = FakeItem.new("Conjured", 1, 10)
      @conjured_item = Conjured.new(@item)
      @conjured_item.update_quality
    end

    it "decreases item quality by two for every update" do
      expect(@item.quality).to eq (8)
    end

    it "decreases item sell_in date by one" do
      expect(@item.sell_in).to eq (0)
    end

    it "decreases item quality date by four after sell_by date" do
      @conjured_item.update_quality
      expect(@item.quality).to eq (4)
    end
  end

  context "normal items- edge cases" do
    it "should not decrease item quality to less than zero" do
      item = FakeItem.new("Conjured", 0, 0)
      conjured_item = Conjured.new(item)
      conjured_item.update_quality
      expect(item.quality).to eq (0)
    end
  end

end
