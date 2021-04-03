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
                "B1", "B2","B3","B4",
                "C1", "C2","C3","C4",
                "D1", "D2","D3","D4"]

    expect(board.cells["A1"]).to be_instance_of(Cell)
    expect(board.cells.keys).to eq(new_cells)
  end

  xit 'has valid coordinates' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end
end


 # the board can hold a cell
 # the board can hold many cells
