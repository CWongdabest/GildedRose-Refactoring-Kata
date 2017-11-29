class Conjured

  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in -= 1
    (@item.sell_in >= 0) ? normal_update : pass_sell_in_date_update
  end

private

  def normal_update
    (@item.quality <= 0) ? @item.quality = 0 : @item.quality -= 2
  end

  def pass_sell_in_date_update
    (@item.quality <= 0) ? @item.quality = 0 : @item.quality -= 4
  end

end
