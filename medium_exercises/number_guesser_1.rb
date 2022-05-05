=begin
Guessing Game is a game with one player and one dealer

The dealer chooses a number at random between 1 and 100

The player has 7 chances to guess the number chosen

For each guess the player, the dealer responds if the players
guess is invalid, too high, too low, or correct

If the player guesses the correct number before
they have 0 chances, they win and the game is over

If the player has used their 7 guesses and doesn't guess
the correct number the game is over and the player has lost

Nouns: Player, Dealer (or computer), Game, Chance

Verb: Chooses a random number, guess, responds, win, loose

Player - Guess, Win, Loose
Dealer - Chooses random number, responds
Game - Has 7 chances, someone won?, someone looses?

=end

class Player
  attr_accessor :guess

  def initialize
    @guess = nil
  end

  def player_guesses
    loop do
      puts "Enter a number between 1 and 100:"
      self.guess = gets.chomp.to_i
      break if (1..100).include?(guess.to_i)
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
    guess
  end
end

class GuessingGame
  attr_accessor :player, :rounds, :number

  def initialize
    @player = Player.new
    @rounds = 7
    @number = choose_random_number
  end

  def play
    until self.rounds <= 0
      display_remaining_guesses
      player.player_guesses
      respond_to_players_guess
      break if player_won?
      self.rounds -= 1
    end

    display_result
  end

  def choose_random_number
    (1..100).to_a.sample
  end

  def display_remaining_guesses
    puts "You have #{rounds} guesses remaining"
  end

  def respond_to_players_guess
    if player.guess < number
      puts "Your guess is too low"
      puts ''
    elsif player.guess > number
      puts "Your guess is too high"
      puts ''
    else
      puts "That's the number!"
      puts ''
    end
  end

  def player_won?
    number == player.guess
  end

  def display_result
    if player_won?
      puts "You won!"
    else
      puts "You lost!"
    end
  end

end

game = GuessingGame.new
game.play
