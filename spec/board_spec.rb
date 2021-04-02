require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'

describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'creates a hash of cells' do
    board = Board.new
    hash = Hash.new
    
    expect(Board.new.cells).to be_a(Hash)
  end

  it 'has rows and columns' do
    board = Board.new

    expect(board.rows).to eq(4)
    expect(board.columns).to eq(4)
  end

  it 'the board can hold a cell' do
    board = Board.new

    expect()
  end
end


# it 'has cells' do
#   board = Board.new
#
#   expect(board.cells).to eq(generate_cells)
# end

 # the board can hold a cell
 # the board can hold many cells
 # profit
