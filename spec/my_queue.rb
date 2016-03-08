require_relative './queue'
require_relative '../src/my_queue'

RSpec.describe MyQueue do
  it_behaves_like 'queue'
end
