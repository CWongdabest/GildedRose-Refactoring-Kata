class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      sulfuras?(item) ? item.sell_in -= 0 : item.sell_in -= 1
      update_item_quality(item)
    end
  end

  def update_item_quality(item)
    if !aged_brie?(item) and !backstage_passes?(item)
      if item.quality > 0
        if !sulfuras?(item)
          item.quality = item.quality - 1
        end
      end
    else
      if item.quality < 50
        item.quality = item.quality + 1
        if backstage_passes?(item)
          if item.sell_in < 11
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end
    end

    if item.sell_in < 0
      if !aged_brie?(item)
        if !backstage_passes?(item)
          if item.quality > 0
            if item.name != "Sulfuras, Hand of Ragnaros"
              item.quality = item.quality - 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
  end

  # def update_quality(items)
  #   items.each do |item|
  #     if aged_brie?(item)
  #       aged_brie = Aged_brie.new(item)
  #       aged_brie.update_quality
  #     end
  #   end
  # end

  def update_brie_quality(item)
    item.sell_in -= 1
    if item.quality < 50
      (item.sell_in >= 0) ? item.quality += 1 : item.quality += 2
    end
  end

  def update_backstage_passes_quality(item)
    item.sell_in -= 1
      if item.sell_in >= 0
        if item.sell_in > 11
          item.quality += 1
        elsif item.sell_in > 5 && item.sell_in < 11
          item.quality += 2
        else
          item.quality += 3
        end
      else
        item.quality = 0
      end
  end

  def normal_item(item)
    item.sell_in -= 1
    item.quality -= 1
  end


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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
