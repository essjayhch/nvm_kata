# frozen_string_literal: true

require 'test_helper'

module NvmKata
  class MathTest < ActiveSupport::TestCase
    test 'Accepts Fixnum' do
      assert NvmKata::Math.new(primitive: 1).valid?
    end

    test 'Accepts Negative' do
      assert NvmKata::Math.new(primitive: -1).valid?
    end

    test 'Accepts float' do
      assert NvmKata::Math.new(primitive: 0.1234).valid?
    end

    test 'Rejects nil' do
      assert !NvmKata::Math.new.valid?
    end

    test 'Rejects sting' do
      assert !NvmKata::Math.new(primitive: 'foobarwat').valid?
    end

    test 'does some sums' do
      assert NvmKata::Math.new(primitive: 1) + 2 == 3
      assert NvmKata::Math.new(primitive: -1) + 2 == 1
      assert_raise(NvmKata::Math::Error) do
        NvmKata::Math.new(primitive: -1) + 'foo'
      end
      assert NvmKata::Math.new(primitive: 0.1234) + 1 == 1.1234
    end

    test 'does some subtractions' do
      assert((NvmKata::Math.new(primitive: 1) - 1).zero?)
      assert NvmKata::Math.new(primitive: 1) - 0.5 == 0.5
      assert NvmKata::Math.new(primitive: -1) - 2 == -3
      assert_raise(NvmKata::Math::Error) do
        NvmKata::Math.new(primitive: 'str') - 1 == -1
      end
      assert NvmKata::Math.new(primitive: 1) - -1 == 2
      assert NvmKata::Math.new(primitive: 1.1234) - 1 == 0.12339999999999995
    end
  end
end
