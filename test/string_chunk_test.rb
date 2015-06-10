require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/string_chunker"


class StringChunkTest < Minitest::Test
TEXT = <<-EOS
This is a paragraph

#This is a header

##Hello
EOS

  def test_returns_chunked_string
    string = "t\n\ns"
    assert_equal ["t", "s"], string.split("\n\n")
  end

  def test_returns_array_of_strings
    string = StringChunker.new("t\n\ns")
    assert_equal ["t", "s"], string.chunk
  end

end

