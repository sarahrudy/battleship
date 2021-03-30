require 'rspec'
require './lib/ship'

describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
  end

  it 'has full health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'is sunk?' do
    cruiser = Ship.new("Cruiser", 3)
  
    expect(cruiser.sunk?).to eq(false)
  end

  it 'took a hit' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    expect(cruiser.health).to eq(2)
    cruiser.hit
    expect(cruiser.health).to eq(1)
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end

end
