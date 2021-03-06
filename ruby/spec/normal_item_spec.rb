require 'normal_item'

describe Normal_item do

  class FakeItem
      attr_accessor :sell_in, :quality

      def initialize(name, sell_in, quality)
        @sell_in = sell_in
        @quality = quality
      end

  end

  context "normal items" do
    before(:each) do
      @item = FakeItem.new("foo", 1, 10)
      @normal_item = Normal_item.new(@item)
      @normal_item.update_quality
    end

    it "decreases item quality by one for every update" do
      expect(@item.quality).to eq (9)
    end

    it "decreases item sell_in date by one" do
      expect(@item.sell_in).to eq (0)
    end

    it "decreases item quality date by two after sell_by date" do
      @normal_item.update_quality
      expect(@item.quality).to eq (7)
    end
  end

  context "normal items- edge cases" do
    it "should not decrease item quality to less than zero" do
      item = FakeItem.new("foo", 10, 10)
      normal_item = Normal_item.new(item)

      11.times do |n|
        normal_item.update_quality
      end

      expect(item.quality).to eq (0)
    end
  end

end
