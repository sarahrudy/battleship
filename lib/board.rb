
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

  def correct_length?(ship, coordinates)
    coordinates.length == ship.length
  end

  # def consecutive?(ship, coordinate)
  #
  def is_horizontal?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0]
    end
    letters_check = letters.uniq.length == 1

    # size of ship will change
    numbers = coordinates.map do |coordinate|
      coordinate[1]
    end
    range = numbers[0]..numbers[-1]
    numbers_check = numbers == range.to_a
      # will fill a range of multiple numbers in a consecutive array
    letters_check && numbers_check
  end

  def is_vertical?(ship, coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[1]
    end
    numbers_check = numbers.uniq.length == 1
    letters = coordinates.map do |coordinate|
      coordinate[0]
    end
    range = letters[0]..letters[-1]
    letters_check = letters == range.to_a
    letters_check && numbers_check
  end
end








    # @rows.each do |row|
    #   @columns.each do |column|
    #
    #     range.each_cons(2) do

# def valid_placement?(ship, coords)
#
# def player_input_valid?(ship, coords)


# from Mike's slack message to group
# def valid_placement?(ship, coords)
#   player_input_valid?(ship, coords) &&
#   (is_horizontal?(ship, coords) ||
#   is_vertical?(ship, coords))
# end
