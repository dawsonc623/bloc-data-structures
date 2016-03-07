require_relative "./linked_list/node"

class LinkedList
    def append_item(item)
        new_node = Node.new(item)

        if (@back_node)
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

        (1..@length).each do
            if (possible_node.item == item)
                contained = true
                break
            else
                possible_node = possible_node.next_node
            end
        end

        contained
    end

    def front
        @front_node.item
    end

    def get_item_at(index)
        if (index > @length)
            raise ArgumentError, "Index is out of range"
        end

        node = @front_node

        if (index > 0)
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
        if (@length > 1)
            contained = false
            previous_node = nil
            possible_node = @front_node

            (1..@length).each do
                if (possible_node.item == item)
                    contained = true
                    break
                else
                    previous_node = possible_node
                    possible_node = possible_node.next_node
                end
            end

            if (contained)
                if (previous_node.nil?)
                    @front_node = @front_node.next_node
                else
                    previous_node.next_node = possible_node.next_node
                end
            else
                raise ArgumentError, "Item is not present"
            end
        elsif (@length == 1)
            if (@front_node.item == item)
                @front_node = nil
                @back_node = nil
            else
                raise ArgumentError, "Item is not present"
            end
        else
            raise ArgumentError, "Item is not present"
        end

        @length -= 1
    end
end