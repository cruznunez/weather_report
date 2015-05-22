require 'minitest/autorun'
require 'minitest/pride'
require 'httparty'
require './conditions_summary.rb'

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
end

class ApplicationTest < Minitest::Test

  # Gotta run migrations before we can run tests.  Down will fail the first time,
  # so we wrap it in a begin/rescue.
  def setup

  end

  def teardown

  end

  def test_truth
    assert true
  end

  def test_false
    refute false
  end

  def test_conditions_summary_class_exists
    assert ConditionsSummary
  end

  def test_conditions_summary_takes_zip_and_prints
    summary1 = ConditionsSummary.new(27516)
    summary2 = ConditionsSummary.new(27701)
    assert_equal "http://www.wunderground.com/weather/api/d/terms.html" ,summary1.test
    assert_equal "http://www.wunderground.com/weather/api/d/terms.html" ,summary2.test
  end
end
