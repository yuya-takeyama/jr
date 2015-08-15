require 'test/unit'
require 'jr/cli/core_ext/hash'

class HashTest < Test::Unit::TestCase
  sub_test_case 'read propertya' do
    test 'read the value' do
      assert do
        {foo: 'bar'}.foo == 'bar'
      end
    end

    test 'return nil if the key does not exist' do
      assert do
        {foo: 'bar'}.bar == nil
      end
    end
  end

  sub_test_case 'check key existence' do
    test 'return true if the key exists' do
      assert do
        {foo: 'bar'}.foo? == true
      end
    end

    test 'return false if the key does not exists' do
      assert do
        {foo: 'bar'}.bar? == false
      end
    end
  end

  sub_test_case 'write property' do
    test 'write value into the property' do
      assert do
        hash = {}
        hash.foo = 'bar'
        hash.foo == 'bar'
      end
    end
  end
end
