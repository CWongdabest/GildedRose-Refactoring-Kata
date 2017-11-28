require 'aged_brie'

describe Aged_brie do

  it "should increase item quality when sell in date decreases" do
    item = Item.new("Aged Brie", 10, 10)
    aged_brie = Aged_brie.new(item)
    aged_brie.update_quality
    expect(item.quality).to eq (11)
  end


end
