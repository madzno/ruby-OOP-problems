class Score
  attr_accessor :board

  def initialize
    @board = { human: 0, computer: 0 }
  end
end

class Record
  attr_accessor :history_of_moves

  def initialize
    @history_of_moves = []
  end

  def add_entry(human_move, computer_move)
    self.history_of_moves << [human_move, computer_move]
  end

  def display_record
    self.history_of_moves.each_with_index do |entry, indx|
      puts "Round #{indx + 1}: Human move was #{entry[0]} and"\
        " Computer move was #{entry[1]}"
    end
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  WINNING_COMBINATIONS = {  'rock' => ['scissors', 'lizard'],
                            'paper' => ['rock', 'spock'],
                            'scissors' => ['paper', 'lizard'],
                            'spock' => ['scissors', 'rock'],
                            'lizard' => ['spock', 'paper'] }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_COMBINATIONS[@value].include?(other_move.value)
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
      puts "Please choose rock, paper, scissors, lizard or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice.downcase)
      puts "Invalid choice. Please choose rock paper, scissors,"\
       "lizard or spock."
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
  attr_accessor :human, :computer, :scoreboard, :number_of_rounds, :record

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Score.new
    @number_of_rounds = 0
    @record = Record.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock."
    puts "The first player who reaches 10 wins is the Ultimate Winner!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def round_winner
    if human.move > computer.move
      :human
    elsif computer.move > human.move
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
    if round_winner == :human
      puts "#{human.name} won!"
    elsif round_winner == :computer
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
    human.choose
    computer.choose
    round_winner
    add_score
    display_moves
    record.add_entry(human.move, computer.move)
    display_round_winner
    display_round_scores
  end

  def play_game
    display_welcome_message

    loop do
      self.scoreboard = Score.new
      self.record = Record.new

      loop do
        self.number_of_rounds += 1
        play_round
        record.display_record if self.number_of_rounds % 3 == 0
        break if ultimate_winner?
      end

      display_ultimate_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play_game
