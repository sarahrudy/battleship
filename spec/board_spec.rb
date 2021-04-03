require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'

describe Board do

  it 'exists' do
    board = Board.new(4, 4)

    expect(board).to be_instance_of(Board)
  end

  it 'has rows and columns' do
    board = Board.new(4, 4)

    expect(board.cells).to eq(cells)
  end



end


# it 'has cells' do
#   board = Board.new
#
#   expect(board.cells).to eq(generate_cells)
# end

 # the board can hold a cell
 # the board can hold many cells
