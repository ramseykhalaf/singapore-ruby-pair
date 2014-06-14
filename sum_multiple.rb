# sum all numbers 1 -> 1000 that are divisible by 3 and 5
require 'minitest/autorun'
require 'minitest/pride'

class SumMultipleTest < MiniTest::Unit::TestCase

    def setup
        @sm = SumMultiple.new
    end

    def test_assert_class_exists
        assert @sm
    end

    def test_multiple_of_divisor
        assert @sm.multiple_of_divisor?(9, 3)
        assert @sm.multiple_of_divisor?(10,5)
        assert  !@sm.multiple_of_divisor?(11,5)
    end

    def test_multiple_of_any_n
        assert !@sm.multiple_of_any?(1, [3])
        assert !@sm.multiple_of_any?(1, [3,5,6])
        assert @sm.multiple_of_any?(3,[3])
        assert @sm.multiple_of_any?(5,[3,5])
        assert @sm.multiple_of_any?(30,[3,5,10])
    end

    def test_sum_to_n_with_divisors
        assert_equal 0, @sm.sum(2, [2])
        assert_equal 0, @sm.sum(2, [2,3])
        assert_equal 2, @sm.sum(3, [2,3])
        assert_equal 23, @sm.sum(10, [3,5])
        assert_equal 233168, @sm.sum(1000, [3,5])
    end

end

class SumMultiple

    def sum(max, divisors)
        sum = 0
        (1...max).each do |n|
            sum += n if multiple_of_any?(n, divisors)
        end
        sum
    end

    def multiple_of_any?(value, divisors)
        multiple = false
        divisors.each do |divisor|
            multiple = true if multiple_of_divisor?(value,divisor)
        end
        multiple
    end

    def multiple_of_divisor?(value, divisor)
        value % divisor == 0
    end
end

