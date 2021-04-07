require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

describe Player do
  it 'exists' do
    player_1 = AI_player
    player_2 = RL_player

    expect(player_1).to be_instance_of(PLayer)
    expect(player_2).to be_instance_of(Player)
  end

  it 'starts new game' do
    game_play = GamePlay.new
    player_1 = AI_player
    player_2 = RL_player
    expected = "  1 2 3 4 \n" +
                  "A . . . . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"

    expect(board.render).to eq(expected)
  end

  it 'player_1 places ships' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["B1", "C1"])

    expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.valid_placement?(submariine, ["B1", "C1"])).to eq(true)
  end
end
