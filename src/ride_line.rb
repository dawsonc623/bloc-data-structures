require_relative './linked_list'

# A RideLine contains a list of all of the riders waiting to board a particular
# ride.
class RideLine
  def add_rider(rider)
    @riders.append_item(rider)
  end

  def back
    @riders.back
  end

  def contains_rider?(rider)
    @riders.contains_item?(rider)
  end

  def front
    @riders.front
  end

  def get_rider_at(index)
    @riders.get_item_at(index)
  end

  def initialize
    @riders = LinkedList.new
  end

  def remove_rider(rider)
    @riders.remove_item(rider)
  end
end
