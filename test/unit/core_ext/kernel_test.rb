require 'test/unit'
require 'jr/cli/core_ext/kernel'

class KernelTest < Test::Unit::TestCase
  sub_test_case '#itself' do
    test 'returns the object itself' do
      assert do
        obj = {}
        obj == obj.itself
      end
    end
  end
end
