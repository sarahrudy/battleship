
class Board
  attr_reader :cells, :rows, :columns
  def initialize(rows = 4, columns = 4)
    @rows    = [] #create array of rows [A..D]
    @columns = [] #create array of columns [1..4]
    @cells   = {}
  end
end



#   def generate_cells
#    # this is probably some nested iteration of some sort
#     stuff.each do |x|
#       x = Cell.new(arg1, arg1) # ????? not sure what a cell is yet
#       ...
#      end
#    end
#  ...
# end

# def build_initial_cells
#   @cells = {
#       :A1 => cell_1,
#       :A2 => cell_2,
#       :A3 => cell_3,
#       :A4 => cell_4,
#       :B1 => cell_5,
#       :B2 => cell_6,
#       :B3 => cell_7,
#       :B4 => cell_8,
#       :C1 => cell_9,
#       :C2 => cell_10,
#       :C3 => cell_11,
#       :C4 => cell_12,
#       :D1 => cell_13,
#       :D2 => cell_14,
#       :D3 => cell_15,
#       :D4 => cell_16
#   }
# end
# 
# def valid_placement?(ship, coords)
#   player_input_valid?(ship, coords) &&
#   (is_horizontal?(ship, coords) ||
#   is_vertical?(ship, coords))
# end
