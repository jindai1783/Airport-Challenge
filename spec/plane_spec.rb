require 'airport'
require 'plane'

describe Plane do

  let (:plane) {Plane.new}
  let (:airport) {Airport.new}
  let (:sunny) {double :weather, storm?: false}

  it 'A plane is airborne when created' do
    expect(plane.airborne?).to eq true
  end

  it 'A plane is airborne when in air' do
    plane.land(airport, sunny)
    plane.fly(airport, sunny)
    expect(plane.airborne?).to eq true
  end
end