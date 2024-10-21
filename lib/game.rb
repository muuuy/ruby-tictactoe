require_relative "board"
require_relative "player"

class Game
  attr_accessor :board, :player1, :player2, :current_turn

  def initialize
    @board = Board.new
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @current_turn = 1
  end

  def play_turn
    if current_turn == 1
      puts "\n--Player 1's Turn--"
    else
      puts "\n--Player 2's Turn--"
    end

    finished = false
    row = nil
    col = nil

    loop do
      print "Enter the row you want to place your piece at: "
      row = gets.chomp.to_i
      print "Now enter the column: "
      col = gets.chomp.to_i

      if is_valid(row, col)
        finished = true
      else
        puts "Invalid. Try again."
      end
      break unless finished == false
    end

    board.place_piece(row, col, (current_turn == 1) ? player1.mark : player2.mark)

    board.display_board

    change_turn
  end

  def check_win
    if board.check_tie == true || board.check_win
      return true
    end

    return false
  end

  private

  def is_valid(x, y)
    if (x < 0) || (x > 2) || (y < 0) || (y > 2)
      return false
    elsif board.is_empty(x, y) == false
      return false
    end

    true
  end

  def change_turn
    if current_turn == 1
      self.current_turn += 1
    else
      self.current_turn -= 1
    end
  end
end
