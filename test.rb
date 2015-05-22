require 'minitest/autorun'
require 'minitest/pride'
require 'httparty'
require './conditions_summary.rb'

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
end

class ApplicationTest < Minitest::Test

  def setup
    @summary = ConditionsSummary.new(27516)
  end
  #
  # def teardown
  #
  # end

  def test_truth
    assert true
  end

  def test_false
    refute false
  end

  def test_conditions_summary_class_exists
    assert ConditionsSummary
  end

  def test_zip_is_accepted
    assert_equal 27516, @summary.zip
  end

  def test_data_access
    assert_equal "http://www.wunderground.com/weather/api/d/terms.html" , @summary.test
  end
end
