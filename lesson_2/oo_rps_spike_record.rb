=begin
As long as the user doesn't quit keep track of a history
of moves by both the human and the computer

After each round, record the computers move and the
human's move
- in the round class have a moves state that is an array of
string moves called history of moves
- for each round append the computers move and the humans
move to the 'history_of_moves' array

Keep track of the rounds
- initialize a state in RPS game called number of rounds
- each time play round is invoked add 1 to the number of rounds
(method count rounds before play round)
- when a new game is started initialize round back to 0 or
initialize a new round object? - number of rounds then is  a state
of the rounds inheretied class OR method reset rounds in RPS game

At round 5, ask if the user would like to see the history
of moves
-output "would you like to see the moves history?"
- if yes - output the moves state
- if not- continue with the game and dont output anything

At the end of the game (ultimate winner reached)
Ask if the user wants to see the moves history
display the history of moves if the user says yes
if the user says no, continue with the game

Round a subclass of RPS game

History a module or collaborator object (a round Has a histroy)
=end

class Score
  attr_accessor :board

  def initialize
    @board = { human: 0, computer: 0 }
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
    WINNING_COMBINATIONS[self.value].include?(other_move.value)
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

class Round < RPSGame
  attr_accessor :number_of_rounds, :round_moves
  def initialize
    @number_of_rounds = 0
    @round_moves = []
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

  def play_round
    loop do
      number_of_rounds += 1
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
end

class Round
  attr_accessor :number_of_rounds

  def initialize
    @number_of_rounds = 0
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

  def play_round
    loop do
      number_of_rounds += 1
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
end

class Record
  attr_accessor :history_of_moves

  def initialize
    @history_of_moves = []
  end

  def add_moves(human_move, computer_move)
    @history_of_moves << [human_move, computer_move]
  end

  def display_history_of_moves
    puts "Do you want to see the moves history? Type y if yes"
    answer = gets.chomp
    if ['y'].include?(answer.downcase)
      round = 1
      index = 0
      loop do
        puts "Round #{round}: human's move was #{history_of_moves[index][0]}"\
          "computer's move was #{history_of_moves[index][1]}"
        round += 1
        break if round == history_of_moves.length
      end
    end
  end
end

class RPSGame

  attr_accessor :human, :computer, :scoreboard, :round, :record

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Score.new
    @round = Round.new
    @record = Record.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock."
    puts "The first player who reaches 10 wins is the Ultimate Winner!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
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

  def play_game
    display_welcome_message
    loop do
      self.scoreboard = Score.new
      self.round = Round.new
      self.record = Record.new
      round.play_round
      display_ultimate_winner
      break unless play_again?
    end
    record.display_history_of_moves
    display_goodbye_message
  end
end





RPSGame.new.play_game
