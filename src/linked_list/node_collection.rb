# A NodeCollection maintains the Nodes in a LinkedList.
class NodeCollection
  attr_accessor :front_node, :length
  attr_reader   :back_node

  def append_node(node)
    raise TypeError, 'Argument must be Node' unless node.is_a?(Node)

    if @front_node.nil?
      @front_node = node
    else
      @back_node.next_node = node
    end

    @back_node = node
    node.next_node = nil

    @length += 1
  end

  def empty?
    @length == 0
  end

  def get_node_at(index)
    raise IndexError, 'Index is out of range' if index >= @length

    i    = -1
    node = @front_node

    node = node.next_node until index == i += 1

    node
  end

  # Get the node linking to the node for this item
  def get_previous_node(item)
    raise ArgumentError, 'Previous node does not exist' if @length < 2

    previous_node = @front_node

    until previous_node.next_node.nil? || previous_node.next_node.item == item
      previous_node = previous_node.next_node
    end

    unless previous_node.next_node.item == item
      raise ArgumentError, 'Item is not present'
    end

    previous_node
  end

  def initialize
    @length = 0
  end

  def prepend_node(node)
    node.next_node = @front_node
    @front_node    = node

    @length += 1
  end

  def remove_back_node
    raise 'Nothing to remove' if @back_node.nil?

    if @length == 1
      @back_node  = nil
      @front_node = nil
    else
      @back_node = get_node_at(@length - 2)

      @back_node.next_node = nil
    end

    @length -= 1
  end

  def remove_front_node
    raise 'Nothing to remove' if @front_node.nil?

    @front_node = @front_node.next_node
    @back_node  = @front_node if @length < 3

    @length -= 1
  end

  def remove_next_node(node)
    raise TypeError, 'Argument must be Node' unless node.is_a?(Node)

    raise ArgumentException, 'Argument has no next node' if node.next_node.nil?

    node.next_node = node.next_node.next_node
    @back_node = node if node.next_node.nil?

    @length -= 1
  end
end
