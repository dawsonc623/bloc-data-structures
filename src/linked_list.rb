require_relative './linked_list/node'

# A LinkedList is a list of items encapsulated in nodes in sequential order.
class LinkedList
  def append_item(item)
    new_node = Node.new(item)

    if @back_node
      @back_node.next_node = new_node
    else
      @front_node = new_node
    end

    @back_node = new_node
    @length += 1
  end

  def back
    @back_node.item
  end

  def contains_item?(item)
    contained = false
    possible_node = @front_node

    until contained || possible_node.nil?
      contained = possible_node.item == item
      possible_node = possible_node.next_node unless contained
    end

    contained
  end

  def empty?
    @length == 0
  end

  def front
    @front_node.item
  end

  def get_item_at(index)
    raise ArgumentError, 'Index is out of range' if index > @length

    node = @front_node

    if index > 0
      (1..index).each do
        node = node.next_node
      end
    end

    node.item
  end

  def initialize
    @length = 0
  end

  def remove_item(item)
    if @length > 2
      contained = false
      previous_node = nil
      possible_node = @front_node

      until contained || possible_node.nil?
        contained = possible_node.item == item

        unless contained
          previous_node = possible_node
          possible_node = possible_node.next_node
        end
      end

      raise ArgumentError, 'Item is not present' unless contained

      # First item shoud be removed if there is no previous node
      if previous_node.nil?
        @front_node = @front_node.next_node
      else
        previous_node.next_node = possible_node.next_node
      end
    elsif @length == 2
      if @front_node.item == item
        @front_node = @back_node
      elsif @back_node.item == item
        @back_node = @front_node
      else
        raise ArgumentError, 'Item is not present'
      end
    elsif @length == 1
      raise ArgumentError, 'Item is not present' unless @front_node.item == item

      @front_node = nil
      @back_node  = nil
    else
      raise ArgumentError, 'Item is not present'
    end

    @length -= 1
  end
end
