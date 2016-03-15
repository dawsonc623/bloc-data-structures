require_relative './queue'
require_relative '../src/linked_list_queue'

RSpec.describe LinkedListQueue do
  it_behaves_like 'queue'
end
