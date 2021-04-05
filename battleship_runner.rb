require './lib/ship'
require './lib/cell'
require './lib/board'


class Start

  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)


  puts "Welcome to BATTLESHIP"
  puts "---------------------"
end 
