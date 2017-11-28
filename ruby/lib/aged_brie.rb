

class Aged_brie

  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in -= 1
    if @item.quality < 50
      (@item.sell_in >= 0) ? @item.quality += 1 : @item.quality += 2
    end
  end

end
