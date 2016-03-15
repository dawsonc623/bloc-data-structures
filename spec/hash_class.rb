require_relative '../src/hash_class'

RSpec.describe HashClass do
  it 'should allow insertion by subscript operator' do
    hash_class = HashClass.new

    hash_class['a'] = :item

    expect(hash_class.key?('a')).to(be(true))
  end

  it 'should allow retreiving by subscript operator' do
    hash_class = HashClass.new

    hash_class['a'] = :item

    expect(hash_class['a']).to(be(:item))
  end

  it 'should allow updating values by subscript operator' do
    hash_class = HashClass.new

    hash_class['a'] = :item1
    hash_class['a'] = :item2

    expect(hash_class['a']).to(be(:item2))
  end

  it 'should expand its internal size when a collision occurs' do
    hash_class = HashClass.new

    hash_class['b'] = :item1
    hash_class['i'] = :item2

    expect(hash_class.capacity).to(eq(11))
  end
end
