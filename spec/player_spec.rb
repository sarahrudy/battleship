require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

describe Player do

  it 'exists' do
    player = Player.new

    expect(player).to be_instance_of(Player)
  end
end
