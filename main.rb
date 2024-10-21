require_relative "lib/game"

def start_menu
  puts "--Start Menu--"
  puts "1. Start a new game"
  puts "2. Quit"
end

start_menu
user_input = gets.chomp

if user_input == "1"
  game = Game.new
  finished = false

  loop do
    game.play_turn
    finished = game.check_win
    break unless finished == false
  end
end
