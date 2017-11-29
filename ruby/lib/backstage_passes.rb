class Backstage_passes

  def initialize(item)
    @item = item
  end
#
  def update_quality
    @item.sell_in -= 1
    sell_in_date_more_than_11? ? @item.quality += 1 : update_less_than_11
  end

private

  def sell_in_date_more_than_11?
    @item.sell_in > 10
  end

  def update_less_than_11
    @item.sell_in > 5 ? @item.quality += 2 : @item.quality +=3
  end
#
#   def normal_update
#     (@item.sell_in >= 0) ? @item.quality += 1 : @item.quality += 2
#     set_maximum
#   end
#
#   def set_maximum
#     if @item.quality > 50
#       @item.quality = 50
#     end
#   end

end
