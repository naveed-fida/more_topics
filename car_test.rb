require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nill
    assert_nil(@car.name)
  end

  def test_raises_initialize_with_arg
    assert_raises(ArgumentError) do
      @car = Car.new(name: 'Joey')
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_include_car
    arr = []
    arr << @car
    assert_includes(arr, @car)
  end
end
