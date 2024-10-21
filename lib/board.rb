class Board
  attr_accessor :board

  def initialize
    self.board = Array.new(3) { Array.new(3, "-") }
  end

  def place_piece(x, y, symbol)
    if (x < 0) || (x > 2) || (y < 0) || (y > 2)
      puts "Index #{x}, #{y} out of bounds."
    else
      board[x][y] = symbol
    end
  end

  def check_win
    (0..2).each do |i|
      return board[i][0] if board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != "-" # check row
      return board[0][i] if board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != "-" # check col
    end

    # check diagonals
    return board[0][0] if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "-"
    return board[2][0] if board[2][0] == board[1][1] && board[1][1] == board[0][2] && board[2][0] != "-"

    # no winner
    false
  end

  def is_empty(x, y)
    board[x][y] == "-"
  end

  def display_board
    board.each do |row|
      puts "#{row[0]} | #{row[1]} | #{row[2]}"
    end
  end

  def check_tie
    board.each do |row|
      row.each do |i|
        if i == "-"
          return false
        end
      end
    end

    true
  end
end
