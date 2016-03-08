# A Node is a container for an item in a LinkedList that also contains a
# reference to the next Node in the LinkedList.
class Node
  attr_reader :item
  attr_accessor :next_node

  def initialize(item)
    @item = item
  end
end
