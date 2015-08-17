require 'test/unit'
require 'jr/cli/core_ext/enumerator'

class EnumerableTest < Test::Unit::TestCase
  sub_test_case '#size' do
    test 'returns number of elements' do
      enumerator = Enumerator.new do |yielder|
        yielder.yield 1
        yielder.yield 2
        yielder.yield 3
      end

      assert do
        enumerator.size == 3
      end
    end
  end
end
