require_relative './linked_list'

# A MyQueue is a FIFO priority structure.
class MyQueue
  def dequeue
    item = @items.front

    @items.remove_item(item)

    item
  end

  def empty?
    @items.empty?
  end

  def enqueue(item)
    @items.append_item(item)
  end

  def initialize
    @items = LinkedList.new
  end
end
