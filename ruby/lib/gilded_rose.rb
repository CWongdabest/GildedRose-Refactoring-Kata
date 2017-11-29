require 'aged_brie'
require 'sulfuras'
require 'normal_item'
require 'backstage_passes'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_item_quality(item)
    end
  end

  def update_item_quality(item)
    if aged_brie?(item)
      aged_brie = Aged_brie.new(item)
      aged_brie.update_quality
    elsif backstage_passes?(item)
      backstage_passes = Backstage_passes.new(item)
      backstage_passes.update_quality
    elsif sulfuras?(item)
      sulfuras = Sulfuras.new(item)
      sulfuras.update_quality
    else
      normal_item = Normal_item.new(item)
      normal_item.update_quality
    end
  end

private

  def aged_brie?(item)
    item.name == "Aged Brie"
  end

  def backstage_passes?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end


end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
  #
  # def to_s()
  #   "#{@name}, #{@sell_in}, #{@quality}"
  # end
end
