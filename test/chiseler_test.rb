require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/chiseler"


class ChiselerTest < Minitest::Test

  def test_is_it_header_or_paragraph
    chunk = ["## dog", "# cat", "donkey"]
    assert_equal [true, true, false], chunk.map { |str| str.include?("#")}
  end

  def test_it_returns_paragraphs
    string = Chiseler.new(["t", "s"])
    assert_equal "<p>t</p>\n\n<p>s</p>", string.header_paragraph
  end

  def test_it_returns_headers
    string = Chiseler.new(["##t", "s"])
    assert_equal "<h2>t</h2>\n\n<p>s</p>", string.header_paragraph
  end

  def test_it_replaces_em_and_strong
    string = Chiseler.new(["getting **more** complicated", "now that *we* know"])
    assert_equal "<p>getting <strong>more</strong> complicated</p>\n\n<p>now that <em>we</em> know</p>", string.header_paragraph
  end

  def test_it_handles_unordered_lists
    string = Chiseler.new("* one\n* two\n* three")
    assert_equal "<ul>\n<li>one</li>\n<li>two</li>\n<li>three</li>\n</ul>", string.unordered_list_formatter("* one\n* two\n* three")
  end

  def test_it_handles_ordered_lists
    string = Chiseler.new("1. cool\n2. super cool\n3. extremely cool")
    assert_equal "<ol>\n<li>cool</li>\n<li>super cool</li>\n<li>extremely cool</li>\n</ol>", string.ordered_list_formatter("1. cool\n2. super cool\n3. extremely cool")
  end

end
