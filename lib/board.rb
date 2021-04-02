class Board
  attr_reader :cells

  def initialize(rows = 4, columns = 4, ship_list = [])
    @cells   = build_initial_cells
  end

  def build_initial_cells
    @cells = {
        :A1 => cell_1,
        :A2 => cell_2,
        :A3 => cell_3,
        :A4 => cell_4,
        :B1 => cell_5,
        :B2 => cell_6,
        :B3 => cell_7,
        :B4 => cell_8,
        :C1 => cell_9,
        :C2 => cell_10,
        :C3 => cell_11,
        :C4 => cell_12,
        :D1 => cell_13,
        :D2 => cell_14,
        :D3 => cell_15,
        :D4 => cell_16
    }
  end
end
