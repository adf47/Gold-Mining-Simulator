require 'minitest/autorun'
require_relative 'prospector'

class ProspectorTest < Minitest::Test

    # UNIT TESTS FOR METHOD location_count() in Prospector Class
    # Equivalence classes:
    # SHOLD ALWAYS RETURN 1. This method keeps a count of prospector
    # location visits. Will Always return 1 no matter what.

    #Test to confirm 1 is returned when called
    def test_location_count
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.location_count()
    end

    #Test to confirm that 1 is returned everytime to achieve a count
    def test_location_count_repeat
        count = 0
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        80.times {count += pete.location_count}
        assert_equal 80, count
    end


    # UNIT TESTS FOR METHOD mine(iteration,city) in Prospector Class
    # Equivalence classes:
    # iteration = -INFINITY..-1 -> returns nil
    # iteration = 1..INFINITY -> returns 1, and mining goes as expected
    # iteration = 0 -> returns 1, and mining goes as expected
    # city = -INFINITY..-1 -> returns nil
    # city = 1..INFINITY -> returns 1, and mining goes as expected
    # city = 0 -> returns 1, and mining goes as expected

    #Tests that negative itetation returns nil
    #EDGE CASE
    def test_negative_iteration_mine
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_nil pete.mine(-1,1)
    end

    #Tests that 0 itetation returns 1
    #EDGE CASE
    def test_zero_iteration_mine
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.mine(0,1)
    end

    #Tests that valid iteration input < 4 returns 1
    def test_iteration_mine_passes_less_than_four
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.mine(2,1)
    end

    #Tests that valid input = 4 returns 1
    #EDGE CASE
    def test_iteration_mine_passes_equal_four
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.mine(4,1)
    end

    #Tests that valid iteration input = 4 returns 1
    #EDGE CASE
    def test_iteration_mine_passes_greater_than_four
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.mine(5,1)
    end

    #Tests that negative city value returns nil
    #EDGE CASE
    def test_negative_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_nil pete.mine(1,-1)
    end

    #Tests that 0 city value returns 1
    #EDGE CASE
    def test_zero_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.mine(1,0)
    end

    #Tests that 7 city value returns nil
    #EDGE CASE
    def test_seven_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_nil pete.mine(1,7)
    end

    #Tests that valid city value returns 1
    def test_passes_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        pete = Prospector.new(mock_map)
        assert_equal 1, pete.mine(1,4)
    end

end
