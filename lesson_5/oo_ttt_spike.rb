require 'pry'

module Display
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're #{human.marker}. Computer is a #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when TTTGame::HUMAN_MARKER
      puts "You won!"
    when TTTGame::COMPUTER_MARKER
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def display_play_again_message
    puts "Lets play again!"
    puts ''
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joinor(arr, symbol = ', ', word = 'or')
    case arr.size
    when 0 then ' '
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(symbol)
    end
  end

  def display_score
    puts "Player's score is #{scoreboard.scores[:player]} and Computer's" \
    " score is #{scoreboard.scores[:computer]}"
    puts "First player to 5 is the Ultimate Winner!"
  end

  def display_ultimate_winner
    if scoreboard.scores[:computer] == TTTGame::WINNING_SCORE
      puts "Computer is the Ultimate Winner!"
    else
      puts "You are the Ultimate Winner!"
    end
  end
end

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITAL_MARKER
  end

  def marked?
    marker != INITAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Computer < Player
  def computer_offense(board_hash)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board_hash, TTTGame::COMPUTER_MARKER)
      break if square
    end
    square
  end

  def computer_defense(board_hash)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board_hash, TTTGame::HUMAN_MARKER)
      break if square
    end
    square
  end

  def find_at_risk_square(line, board_hash, marker)
    if board_hash.values_at(*line).select do |square|
         square.marker == marker
       end.length == 2
      board_hash.select do |k, v|
        line.include?(k) && v.marker == Square::INITAL_MARKER
      end.keys.first
    end
  end
end

class Human < Player
end

class ScoreBoard
  attr_reader :scores

  def initialize
    @scores = { player: 0, computer: 0 }
  end

  def reset
    initialize
  end
end

class TTTGame
  include Display

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  WINNING_SCORE = 5

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @scoreboard = ScoreBoard.new
  end

  def play
    loop do
      clear
      display_welcome_message
      main_game
      display_ultimate_winner
      break unless play_again?
      reset
      scoreboard.reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer, :scoreboard

  def main_game
    loop do
      reset
      display_board
      play_round
      display_result
      tally_score
      display_score
      break if ultimate_winner?
    end
  end

  def play_round
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def human_moves
    puts "Chose a square (#{joinor(board.unmarked_keys)}): "
    square = nil

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end

    board[square] = human.marker
  end

  def play_again?
    answer = nil
    loop do
      puts "Whould you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def tally_score
    if board.winning_marker == HUMAN_MARKER
      scoreboard.scores[:player] += 1
    elsif board.winning_marker == COMPUTER_MARKER
      scoreboard.scores[:computer] += 1
    end
  end

  def ultimate_winner?
    scoreboard.scores[:computer] == WINNING_SCORE ||
      scoreboard.scores[:player] == WINNING_SCORE
  end

  def computer_moves
    key = if computer.computer_offense(board.squares)
            computer.computer_offense(board.squares)
          elsif computer.computer_defense(board.squares)
            computer.computer_defense(board.squares)
          elsif board.squares[5].marker == Square::INITAL_MARKER
            5
          else
            board.unmarked_keys.sample
          end
    board.squares[key].marker = TTTGame::COMPUTER_MARKER
  end
end

game = TTTGame.new
game.play
