require_relative '../src/screen'
require_relative '../src/screen/pixel'
require_relative '../src/screen/pixel/color'
require_relative '../src/screen/pixel/location'

RSpec.describe Screen do
  it 'should store Pixels by location' do
    pixel  = Pixel.new(Color.new(90, 40, 50), Location.new(15, 37))
    screen = Screen.new(16, 38)

    screen.add_pixel(pixel)

    expect(screen.get_pixel_at(15, 37)).to(be(pixel))
  end
end
