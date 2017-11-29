class Backstage_passes

  def initialize(item)
    @item = item
  end
#
  def update_quality
    @item.sell_in -= 1
    @item.quality += 1
  end
#
# private
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
