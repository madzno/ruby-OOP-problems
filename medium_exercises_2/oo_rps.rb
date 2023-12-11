class Score
  attr_accessor :board

  def initialize
    @board = { human: 0, computer: 0 }
  end
end

module ClearText
  def clear_text
    puts "Press Enter to Continue"
    user_input = gets.chomp
    system 'clear' if user_input
  end
end

module Display
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock."
    puts "The first player who reaches 10 wins is the Ultimate Winner!"
  end

  def display_computer
    puts "Your opponent is #{computer.name}"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
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

  def display_ultimate_winner
    if scoreboard.board[:human] == 10
      puts "#{human.name} is the ultimate winner!"
    elsif scoreboard.board[:computer] == 10
      puts "#{computer.name} is the ultimate winner!"
    end
  end

  def display_record
    puts "The Current Game's Record is:"
    history_of_moves.each_with_index do |entry, indx|
      puts "Round #{indx + 1}: Your move was #{entry[0]} and"\
        " Computer move was #{entry[1]}"
    end
    clear_text
  end
end

class Record
  include ClearText
  include Display

  def initialize
    @history_of_moves = []
  end

  def add_entry(human_move, computer_move)
    history_of_moves << [human_move, computer_move]
  end

  protected

  attr_accessor :history_of_moves
end

class Move
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

  protected

  attr_reader :value
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
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

  private

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
end

class Daenerys < Player
  def choose
    self.move = Move.new('lizard')
  end

  private

  def set_name
    self.name = "Daenerys Targaryen"
  end
end

class TheMountain < Player
  def choose
    self.move = Move.new('rock')
  end

  private

  def set_name
    self.name = "The Mountain"
  end
end

class NedStark < Player
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  private

  def set_name
    self.name = "Ned Stark"
  end
end

class RPSGame
  include ClearText
  include Display

  def initialize
    @computer = choose_computer_player
    @scoreboard = Score.new
    @number_of_rounds = 0
    @record = Record.new
  end

  private

  attr_accessor :human, :computer, :scoreboard, :number_of_rounds, :record

  def initialize_human
    @human = Human.new
  end

  def choose_computer_player
    [Daenerys.new, TheMountain.new, NedStark.new].sample
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

  def ultimate_winner?
    scoreboard.board[:human] == 10 || scoreboard.board[:computer] == 10
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
    self.number_of_rounds += 1
    human.choose
    computer.choose
    round_winner
    add_score
    display_moves
    record.add_entry(human.move, computer.move)
    display_round_winner
    display_round_scores
    clear_text
  end

  def play_to_ultimate_winner
    loop do
      play_round
      record.display_record if self.number_of_rounds % 3 == 0
      break if ultimate_winner?
    end
    display_ultimate_winner
  end

  public

  def play_game
    display_welcome_message
    initialize_human
    loop do
      initialize
      display_computer
      play_to_ultimate_winner
      record.display_record
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play_game

