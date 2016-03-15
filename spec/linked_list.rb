require_relative '../src/linked_list'

RSpec.describe LinkedList do
  before(:each) do
    @linked_list = LinkedList.new

    @linked_list.add_to_tail(:item1)
    @linked_list.add_to_tail(:item2)
    @linked_list.add_to_tail(:item3)
  end

  it 'should add items to the tail of the list' do
    expect(@linked_list.back).to(be(:item3))
  end

  it 'should remove items from the tail of the list' do
    @linked_list.remove_tail

    expect(@linked_list.back).to(be(:item2))
    expect(@linked_list.contains_item?(:item3)).to(be(false))
  end

  it 'should delete nodes from the list' do
    @linked_list.delete(:item2)

    expect(@linked_list.get_item_at(1)).to(be(:item3))
    expect(@linked_list.contains_item?(:item2)).to(be(false))
  end

  it 'should add nodes to the front of the list' do
    @linked_list.add_to_front(:item0)

    expect(@linked_list.front).to(be(:item0))
  end

  it 'should remove items from the front of the list' do
    @linked_list.remove_front

    expect(@linked_list.front).to(be(:item2))
    expect(@linked_list.contains_item?(:item1)).to(be(false))
  end
end
