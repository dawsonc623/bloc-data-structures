require_relative './stack'
require_relative '../src/queue_stack'

RSpec.describe QueueStack do
  it_behaves_like 'stack'
end
