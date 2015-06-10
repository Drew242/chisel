

class List

  def initialize(string)
    @string = string
  end

  def list_sub
    @string.gsub(@string[0..1], "<li>") + "</li>"
  end

end