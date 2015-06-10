require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/list"

class ListTest < Minitest::Test

  def test_thing
    str = "1.one"
    assert_equal "<li>one</li>", str.gsub("1.", "<li>") + "</li>"
  end

  def test_other_thing
    example = List.new("1.one")
    assert_equal "<li>one</li>", example.list_sub
  end

  def test_number_other_than_one
    example = List.new("2.two")
    assert_equal "<li>two</li>", example.list_sub
  end


end