require 'aged_brie'
require 'sulfuras'
require 'normal_item'
require 'backstage_passes'
require 'conjured'
require 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      normal_item?(item) ? update_normal_item(item) : update_special_item(item)
    end
  end

private

  def normal_item?(item)
    item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Conjured" && item.name != "Sulfuras, Hand of Ragnaros"
  end

  def update_aged_brie(item)
    aged_brie = Aged_brie.new(item)
    aged_brie.update_quality
  end

  def update_backstage_passes(item)
    backstage_passes = Backstage_passes.new(item)
    backstage_passes.update_quality
  end

  def update_sulfuras(item)
    sulfuras = Sulfuras.new(item)
    sulfuras.update_quality
  end

  def update_conjured(item)
    conjured = Conjured.new(item)
    conjured.update_quality
  end

  def update_normal_item(item)
    normal_item = Normal_item.new(item)
    normal_item.update_quality
  end

  def update_special_item(item)
      case item.name
        when "Aged Brie"
          update_aged_brie(item)
        when "Backstage passes to a TAFKAL80ETC concert"
          update_backstage_passes(item)
        when "Conjured"
          update_conjured(item)
        else
          update_sulfuras(item)
      end
  end

end
