require_relative './linked_list'

# A MyStack is a LIFO priority structure.
class MyStack
  def empty?
    @items.empty?
  end

  def initialize
    @items = LinkedList.new
  end

  def pop
    item = @items.back
    @items.remove_item(item)

    item
  end

  def push(item)
    @items.append_item(item)
  end
end
