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

    expect(board.rows).to eq(4)
    expect(board.columns).to eq(4)
  end
  # it 'has cells' do
  #   board = Board.new
  #
  #   expect(board.cells).to eq(generate_cells)
  # end
end




 # the board can hold a cell
 # the board can hold many cells
 # profit
