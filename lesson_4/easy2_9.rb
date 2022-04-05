class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin
If we put a method named 'play' in the Bingo
class this method would overwrite the 'play' method
in the 'Game class'. As soon as Ruby finds a method
in the Bingo method class lookup chain named 'play'
it will execute it and it first searches the 'Bingo` class.
=end
