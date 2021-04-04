
class Board
  attr_reader :cells

  def initialize
    @columns = 1..4 # range class
    @rows = "A".."D"
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
    correct_length?(ship, coordinates)
  end

  def correct_length?(ship, coordinates)
    coordinates.length == ship.length
  end

  def split_coord(coordinates, index)
    coordinates.map do |coordinate|
      coordinate[(index)]
    end
  end

  def uniq_size?(coordinates, index)
    split_coord(coordinates, index).uniq.length == 1
  end

  def is_horizontal?(ship, coordinates)
    range = split_coord(coordinates, 1)[0]..split_coord(coordinates, 1)[-1]
    numbers_check = split_coord(coordinates, 1) == range.to_a
    uniq_size?(coordinates, 0) && numbers_check
  end

  def is_vertical?(ship, coordinates)
    range = split_coord(coordinates, 0)[0]..split_coord(coordinates, 0)[-1]
    letters_check = split_coord(coordinates, 0) == range.to_a
    uniq_size?(coordinates, 1) && letters_check
  end

  def is_consecutive?(ship, coordinates)
    coordinates.each_cons(2) do |coordinate|
    coordinate
    end

  end

  def overlap?(coordinates)
    coordinates.all? do |coordinate|
      @cells.key?(coordinate) && @cells[coordinate].empty?
    end
  end
end



# def valid_placement?(ship, coords)
# board.place_ship
# def player_input_valid?(ship, coords)


# from Mike's slack message to group
# def valid_placement?(ship, coords)
#   player_input_valid?(ship, coords) &&
#   (is_horizontal?(ship, coords) ||
#   is_vertical?(ship, coords))
# end

#
# def letters(coordinates)
#   coordinates.map do |coordinate|
#     coordinate[0]
#   end
# end
#
# def letters_check(coordinates)
#   letters(coordinates).uniq.length == 1
# end
#
# def numbers(coordinates)
#   coordinates.map do |coordinate|
#     coordinate[1]
#   end
# end
#
# def numbers_check(coordinates)
#   numbers(coordinates) == ((coordinates[0])..(coordinates[-1])).to_a
# end
#
# def is_horizontal?(ship, coordinates)
#   letters_check(coordinates) && numbers_check(coordinates)
# end
