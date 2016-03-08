require_relative './queue'
require_relative '../src/stack_queue'

RSpec.describe StackQueue do
  it_behaves_like 'queue'
end
