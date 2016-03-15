require 'benchmark'
require_relative './linked_list'

Benchmark.bm(12) do |benchmark|
  benchmark.report('Array:') do
    Array.new(10_000, :item)
  end

  benchmark.report('LinkedList:') do
    linked_list = LinkedList.new

    (1..10_000).each do
      linked_list.add_to_tail(:item)
    end
  end
end

Benchmark.bm(12) do |benchmark|
  array = Array.new(10_000, :item)
  linked_list = LinkedList.new

  (1..10_000).each do
    linked_list.add_to_tail(:item)
  end

  benchmark.report('Array:') do
    array[5_000]
  end

  benchmark.report('LinkedList:') do
    linked_list.get_item_at(5_000)
  end
end

Benchmark.bm(12) do |benchmark|
  array = Array.new(10_000, :item)
  linked_list = LinkedList.new

  (1..10_000).each do
    linked_list.add_to_tail(:item)
  end

  benchmark.report('Array:') do
    array.delete_at(5_000)
  end

  benchmark.report('LinkedList:') do
    linked_list.remove_item_at(5_000)
  end
end
