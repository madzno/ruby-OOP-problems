class Score
  attr_accessor :board

  def initialize
    @board = { human: 0, computer: 0 }
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice.downcase)
      puts "Invalid choice. Please choose rock paper, or scissors"
    end
    self.move = Move.new(choice.downcase)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', '3CPO', 'Luke', 'Leia'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end
# Game Orchenstration Engine

class RPSGame
  attr_accessor :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Score.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors."
    puts "The first player who reaches 10 wins is the Ultimate Winner!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def round_winner
    if human.move > computer.move
      :human
    elsif human.move < computer.move
      :computer
    end
  end

  def add_score
    if round_winner == :human
      scoreboard.board[:human] += 1
    elsif round_winner == :computer
      scoreboard.board[:computer] += 1
    end
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "Its a tie!"
    end
  end

  def display_round_scores
    puts "#{human.name}'s score is #{scoreboard.board[:human]} and "\
    "#{computer.name}'s score is #{scoreboard.board[:computer]}"
  end

  def ultimate_winner?
    scoreboard.board[:human] == 10 || scoreboard.board[:computer] == 10
  end

  def display_ultimate_winner
    if scoreboard.board[:human] == 10
      puts "#{human.name} is the ultimate winner!"
    elsif scoreboard.board[:computer] == 10
      puts "#{computer.name} is the ultimate winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def play_round
    loop do
      human.choose
      computer.choose
      round_winner
      add_score
      display_moves
      display_round_winner
      display_round_scores
      break if ultimate_winner?
    end
  end

  def play_game
    display_welcome_message
    loop do
      self.scoreboard = Score.new
      play_round
      display_ultimate_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play_game
