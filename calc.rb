require 'minitest/autorun'
require 'minitest/pride'

class CalcTest < MiniTest::Unit::TestCase

    def test_class_exists
        calc = Calc.new
        assert calc
    end

    def test_add
        calc = Calc.new
        sum = calc.add(1,2)
        assert_equal 3, sum

        sum = calc.add(2,2)
        assert_equal 4, sum
    end
end

class Calc

    def add(a, b)
        a + b
    end

end