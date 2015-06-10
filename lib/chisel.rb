require_relative "string_chunker"
require_relative "chiseler"

class Chisel
  attr_reader :input, :output

  def initialize
    input = File.read(ARGV[0])
    html = StringChunker.new(input).html
    File.write(ARGV[1], html)
    puts "Converted my_#{ARGV[0]} (#{input.count("\n")} lines) to #{ARGV[1]} (#{html.count("\n")} lines)"
  end

end

Chisel.new
