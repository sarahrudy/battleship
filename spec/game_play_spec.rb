require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game_play'

describe GamePlay do
  it 'exists and has attributes' do
    game_play = GamePlay.new
    player_1 = RL_player
    player_2 = AI_player

    expect(game_play).to be_instance_of(GamePlay)
    expect(player_1).to be_instance_of(PLayer)
    expect(player_2).to be_instance_of(Player)
  end

  it 'starts new game' do
    game_play = GamePlay.new
    player_1 = AI_player
    player_2 = RL_player
    blank_board = "  1 2 3 4 \n" +
                  "A . . . . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"

    expect(board.render).to eq(blank_board)
    expect(game_play.start_game).to eq(intro)
  end

  it 'has player_2 place ships' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["B1", "C1"])

    expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.valid_placement?(submariine, ["B1", "C1"])).to eq(true)
  end

  it 'asks player_1 to place ships' do





end


# player 1 places cruiser and submarine in valid coordinates
# render blank board
# ask player 2 to place their ships


#
# welcome prompt
# computer places ships
# render user board and tell them to place ships
# user places first ship
# error_placement_message
#     error msgs if not valid placement
# render board with ship placement
# user places second ship
#
# game begins with guessing
#
# user guess
# computer guess
#
# feedback for both shots
# error message if not valid coordinate or if it's already been fired_upon
#
# render boards with results from shots fired
#
# rinse repeat
#
# def error_placement_message
# p "try again"
# p "those coordinates do not work, try again"
# end
#
# loop until you get a valid placement
