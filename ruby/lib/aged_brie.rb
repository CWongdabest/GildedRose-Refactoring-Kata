

class Aged_brie

  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in -= 1
    @item.quality < 50 ? update_quality_less_than_50 : @item.quality = 50 
  end

private

  def update_quality_less_than_50
    @item.quality > 48 && @item.sell_in < 0 ? @item.quality = 50 : normal_update
  end

  def normal_update
    (@item.sell_in >= 0) ? @item.quality += 1 : @item.quality += 2
  end



end
