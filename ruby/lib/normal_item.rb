class Normal_item

  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in -= 1
    normal_update
  end

private

  def normal_update
    (@item.quality <= 0) ? @item.quality = 0 : @item.quality -= 1
  end



end
