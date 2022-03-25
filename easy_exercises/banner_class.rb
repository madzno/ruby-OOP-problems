=begin
Test Cases
Horozontal Rule
- + -------------------- +
- always has two + on either side
- - equals the size of the input message minus 2

Empty line
- | |
- | on either side
- number of spaces equals the size of the input message minus 2

message line
- | |
| on either side
- one space on either side
- message in the middle

=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    '+' + '-' * (@message.size + 2) + '+'
  end

  def empty_line
    '|' + ' ' * (@message.size + 2) + '|'
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner
