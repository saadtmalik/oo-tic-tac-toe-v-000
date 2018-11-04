class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value)
    board[index] = value
  end

  def position_taken?(index)
    if board[index] != " "
    end
  end


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    board.count{|token| token == "X" || token == "O"}
  end


  def won?
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def full?
    if board.include? (" ")
      return false
    else
      return true
    end
  end

  def draw?
    if !won? && full?
      return true
    elsif won?
      return false
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if winning_combo = won?
      board[winning_combo.first]
    end
  end

  def play
    until over?|| won?|| full?
    puts 'turn'
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
end
