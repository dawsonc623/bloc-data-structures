require_relative './stack'
require_relative '../src/my_stack'

RSpec.describe MyStack do
  it_behaves_like 'stack'
end
