require_relative "chiseler"


class StringChunker
  attr_reader :chunk, :html

  def initialize(input)
    @chunk = input.split("\n\n")
    @html = Chiseler.new(@chunk).header_paragraph
  end

end


