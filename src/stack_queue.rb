require_relative './my_stack'

# A StackQueue is a FIFO structure built out of LIFO structures (because yeah).
class StackQueue
  def dequeue
    @dequeue_stack.pop
  end

  def empty?
    @dequeue_stack.empty?
  end

  def enqueue(item)
    @enqueue_stack.push(@dequeue_stack.pop) until @dequeue_stack.empty?

    @enqueue_stack.push(item)

    @dequeue_stack.push(@enqueue_stack.pop) until @enqueue_stack.empty?
  end

  def initialize
    @dequeue_stack = MyStack.new
    @enqueue_stack = MyStack.new
  end
end
