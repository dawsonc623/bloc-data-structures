require_relative './my_queue'

# A QueueStack is a LIFO structure built out of FIFO structures (because yeah).
class QueueStack
  def empty?
    @pop_queue.empty?
  end

  def initialize
    @pop_queue  = MyQueue.new
    @push_queue = MyQueue.new
  end

  def pop
    @pop_queue.dequeue
  end

  def push(item)
    @push_queue.enqueue(@pop_queue.dequeue) until @pop_queue.empty?

    @pop_queue.enqueue(item)

    @pop_queue.enqueue(@push_queue.dequeue) until @push_queue.empty?
  end
end
