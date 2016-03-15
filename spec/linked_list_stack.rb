require_relative './stack'
require_relative '../src/linked_list_stack'

RSpec.describe LinkedListStack do
  it_behaves_like 'stack'
end
