=begin
New optionally lets you specify a fixed banner width
at the time the banner object is created

PEDAC
Input - an optional integer argument that represents the width
output - a banner which width is equal to the optional argument integer
What is the width?
default is @message.size (would replace @message.size with width)


How do you handle if the width is too narrow or
too wide?
If the input width is less than or greater than 2 times the
message, return an error message OR default if the width
is less than the message size, width gets reset to message size
default


=end

class Banner
  def initialize(message, width = nil)
    @message = message
    @width = width(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * (@width)}-+"
  end

  def empty_line
    "| #{' ' * (@width)} |"
  end

  def message_line
    if @width > @message.size
      "|#{' ' * (@width / 2)} #{@message} #{' ' * (@width / 2)} |"
    else
      "| #{@message} |"
    end
  end

  def width(width)
    if width == nil || width < @message.size || width > 100
      @message.size
    else
      width.to_i
    end
  end

end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('', 5)
puts banner
