
class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    @cells[coordinate] != nil
  end

  def valid_placement?(ship, coordinates)
    correct_length?(ship, coordinates) && is_horizontal?(ship, coordinates) || is_vertical?(ship, coordinates) && no_overlap?(coordinates)
  end

  def correct_length?(ship, coordinates)
    coordinates.length == ship.length
  end

  def split_coord(coordinates, index)
    coordinates.map do |coordinate|
      coordinate[(index)]
# iterates over coordinates given and returns array of elements for the index called
# if [0] is called, it will return an array of letters
# if [1] is called, it will return an array of numbers
# see 'can split coordinate into letters and numbers' in spec file
    end
  end

  def uniq_size?(coordinates, index)
    split_coord(coordinates, index).uniq.length == 1
# use split_coord method above to split the coordinates, then call the index number on index array
# use built in ruby method .uniq to make the ["A", "A"] return a unique value
# call .length on that and that should be equal to one element
# helper method to check if coordinates are horizontal or vertical below
  end

# numbers
  def is_horizontal?(ship, coordinates)
    range = split_coord(coordinates, 1)[0]..split_coord(coordinates, 1)[-1]
    numbers_check = split_coord(coordinates, 1) == range.to_a
    uniq_size?(coordinates, 0) && numbers_check
    # it will return a boolean value of true (horizontal) if BOTH statements are true
    # require "pry"; binding.pry
  end
# letters
  def is_vertical?(ship, coordinates)
    range = split_coord(coordinates, 0)[0]..split_coord(coordinates, 0)[-1]
    # splits the coordinates into letters and numbers, and grabs first element of array..to last element
    letters_check = split_coord(coordinates, 0) == range.to_a
    uniq_size?(coordinates, 1) && letters_check
    # it will return a boolean value of true (vertical) if BOTH statements are true
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def no_overlap?(coordinates)
    coordinates.all? do |coordinate|
      @cells.key?(coordinate) && @cells[coordinate].empty?
    end
  end
end
