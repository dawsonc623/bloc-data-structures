require_relative '../src/ride_line'
require_relative '../src/ride_line/rider'

RSpec.describe RideLine do
  it 'should have a front' do
    line  = RideLine.new
    rider = Rider.new

    line.add_rider(rider)

    expect(line.front).to(be(rider))
  end

  it 'should have a back' do
    line   = RideLine.new
    rider1 = Rider.new
    rider2 = Rider.new

    line.add_rider(rider1)
    line.add_rider(rider2)

    expect(line.back).to(eq(rider2))
  end

  it 'should allow a rider to leave from any place' do
    line   = RideLine.new
    rider1 = Rider.new
    rider2 = Rider.new
    rider3 = Rider.new

    line.add_rider(rider1)
    line.add_rider(rider2)
    line.add_rider(rider3)

    line.remove_rider(rider2)

    expect(line.get_rider_at(0)).to(be(rider1))
    expect(line.get_rider_at(1)).to(be(rider3))
    expect(line.contains_rider?(rider2)).to(be(false))
  end
end
