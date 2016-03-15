require_relative './linked_list/node'
require_relative './linked_list/node_collection'

# A LinkedList is a list of items encapsulated in nodes in sequential order.
class LinkedList
  def add_to_front(item)
    @nodes.prepend_node(Node.new(item))
  end

  def append_item(item)
    @nodes.append_node(Node.new(item))
  end

  alias add_to_tail append_item

  def back
    @nodes.back_node.item
  end

  def contains_item?(item)
    possible_node = @nodes.front_node

    until possible_node.nil? || possible_node.item == item
      possible_node = possible_node.next_node
    end

    !possible_node.nil?
  end

  def empty?
    @nodes.empty?
  end

  def front
    @nodes.front_node.item
  end

  def get_item_at(index)
    raise IndexError, 'Index is out of range' if index >= @nodes.length

    @nodes.get_node_at(index).item
  end

  def initialize
    @nodes = NodeCollection.new
  end

  def remove_front
    raise 'Nothing to remove' if @nodes.empty?

    @nodes.remove_front_node
  end

  def remove_item(item)
    raise ArgumentError, 'Item is not present' if @nodes.empty?

    if @nodes.front_node.item == item
      remove_front
    else
      previous_node = @nodes.get_previous_node(item)

      @nodes.remove_next_node(previous_node)
    end
  end

  alias delete remove_item

  def remove_item_at(index)
    raise IndexError, 'Index is out of range' if index >= @nodes.length

    if index == 0
      remove_front
    else
      previous_node = @nodes.get_node_at(index - 1)

      @nodes.remove_next_node(previous_node)
    end
  end

  def remove_tail
    raise 'Nothing to remove' if @nodes.empty?

    @nodes.remove_back_node
  end
end
