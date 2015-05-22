require 'minitest/autorun'
require 'minitest/pride'
require './conditions_summary.rb'

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
end
