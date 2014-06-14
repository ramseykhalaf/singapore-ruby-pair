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
        assert !@sm.multiple?(1, [3])
        assert !@sm.multiple?(1, [3,5,6])
        assert @sm.multiple?(3,[3])
        assert @sm.multiple?(5,[3,5])
        assert @sm.multiple?(30,[3,5,10])
    end

    def test_sum_to_n_with_divisors
        assert_equal 98, @sm.sum(20, [3,5])
    end


end

class SumMultiple

    def sum(max, divisors)
        sum = 0
        (1..max).each do |n|
            sum += n if multiple?(n, divisors)
        end
        sum
    end

    def multiple?(value, divisors)
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

