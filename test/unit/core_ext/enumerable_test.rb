require 'test/unit'
require 'jr/cli/core_ext/enumerable'

class EnumerableTest < Test::Unit::TestCase
  sub_test_case '#unwrap' do
    test 'unwrap Array of Arrays' do
      assert do
        input = [
          ['a', 'b', ['c']],
          ['A']
        ]
        expected = ['a', 'b', ['c'], 'A']

        input.unwrap.to_a == expected
      end
    end

    test 'unwrap Array of Hashes' do
      assert do
        input = [
          {a: 'A', b: 'B', c: {cc: 'CC'}},
          {aa: 'AA'},
        ]
        expected = ['A', 'B', {cc: 'CC'}, 'AA']

        input.unwrap.to_a == expected
      end
    end
  end
end
