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
  end

  it 'does not have a valid coordinate' do
    board = Board.new

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

  xit 'has consecutive coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.is_consecutive?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.is_consecutive?(submarine, ["A1","C1"])).to eq(false)
    expect(board.is_consecutive?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.is_consecutive?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'does not overlap' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # checking to see if coordinates overalap eachother
    # board.place(cruiser, (["B1", "C1", "D1"])
    expect(board.overlap?(["B1", "B2", "B3"])).to eq(true)

    # expect(board.overlap?(["B1", "B1", "B2"])).to eq(false)
  end
end

  # xit 'cannot be diagonal' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  #
  #   expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
  #   expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  # end

  # xit 'is valid placement if all previous checks pass' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  #
  #   expect(board.correct_length?(submarine, ["A1", "A2"])).to eq(true)
  #   expect(board.correct_length?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  # end
