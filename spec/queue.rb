RSpec.shared_examples 'queue' do
  it 'should know when it is empty' do
    queue = described_class.new

    expect(queue.empty?).to(be(true))
  end

  it 'should enqueue items in the queue' do
    queue = described_class.new

    queue.enqueue(:item1)

    expect(queue.empty?).to(be(false))
  end

  it 'should dequeue items from the queue' do
    queue = described_class.new

    queue.enqueue(:item1)

    expect(queue.dequeue).to(be(:item1))
    expect(queue.empty?).to(be(true))
  end

  it 'should maintain FIFO priority' do
    queue = described_class.new

    queue.enqueue(:item1)
    queue.enqueue(:item2)

    expect(queue.dequeue).to(be(:item1))
    expect(queue.dequeue).to(be(:item2))
  end
end
