require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'

describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new

    new_cells = ["A1","A2","A3","A4",
                 "B1","B2","B3","B4",
                 "C1","C2","C3","C4",
                 "D1","D2","D3","D4"]

    expect(board.cells["A1"]).to be_instance_of(Cell)
    expect(board.cells.keys).to eq(new_cells)
  end

  it 'has valid coordinates' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'ship has same length as coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.correct_length?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.correct_length?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.correct_length?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    expect(board.correct_length?(submarine, ["A1", "A2"])).to eq(true)
  end

 it 'can pass all valid placement tests' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      #correct length
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      # consecutive
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
      # cant be diagonal
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'can split coordinate into letters and numbers' do
    board = Board.new
    #letter
    expect(board.split_coord(["A1", "A2"], 0)).to eq(["A", "A"])
    expect(board.split_coord(["A1", "B2"], 0)).to eq(["A", "B"])
    #number
    expect(board.split_coord(["A1", "A2"], 1)).to eq(["1", "2"])
    expect(board.split_coord(["A1", "B1"], 1)).to eq(["1", "1"])
  end

  it 'can determine unique elements in array' do
    board = Board.new
    #letters
    expect(board.uniq_size?(["A1", "A2"], 0)).to eq(true)
    expect(board.uniq_size?(["A1", "B2"], 0)).to eq(false)
    #numbers
    expect(board.uniq_size?(["A1", "B1"], 1)).to eq(true)
    expect(board.uniq_size?(["A1", "A2"], 1)).to eq(false)
  end

  it 'is horizontal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.is_horizontal?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.is_horizontal?(cruiser, ["A1", "B1", "C1"])).to eq(false)
  end

  it 'is vertical' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.is_vertical?(submarine, ["A1", "B1"])).to eq(true)
    expect(board.is_vertical?(cruiser, ["A1", "A2", "A3"])).to eq(false)
  end

  it 'can place a ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(board.cells["A1"].render(true)).to eq("S")
    expect(board.cells["A2"].render(true)).to eq("S")
    expect(board.cells["A3"].render(true)).to eq("S")

    expect(cell_1.ship).to be_instance_of(Ship)
    expect(cell_2.ship).to be_instance_of(Ship)
    expect(cell_3.ship).to be_instance_of(Ship)

    expect(cell_3.ship).to eq(cell_2.ship)
  end

  it 'cannont place ships to overlap' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

  it 'can render blank board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    # require "pry"; binding.pry
    blank_board = "  1 2 3 4 \n" +
                  "A . . . . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"
    expect(board.render).to eq(blank_board)
  end

  xit 'can render board with user cruiser' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    user_board = "   1 2 3 4 \n" +
                  "A S S S . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.render(true)).to eq("   1 2 3 4 \n" +
                                      "A S S S . \n" +
                                      "B . . . . \n" +
                                      "C . . . . \n" +
                                      "D . . . . \n")
  end
end
