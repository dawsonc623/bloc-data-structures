require_relative '../../src/screen/pixel'
require_relative '../../src/screen/pixel/color'
require_relative '../../src/screen/pixel/location'

RSpec.describe Pixel do
  it 'should contain red, greed, and blue values' do
    pixel = Pixel.new(Color.new(90, 40, 50), Location.new(0, 0))

    expect(pixel.red).to(eq(90))
    expect(pixel.green).to(eq(40))
    expect(pixel.blue).to(eq(50))
  end

  it 'should contain x and y location values' do
    pixel = Pixel.new(Color.new(90, 40, 50), Location.new(15, 37))

    expect(pixel.x).to(eq(15))
    expect(pixel.y).to(eq(37))
  end
end
