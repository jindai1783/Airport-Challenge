require 'plane'
require 'airport'

describe Plane do

  let (:plane) {Plane.new}
  let (:airport) {Airport.new}
  let (:sunny) {double :weather, storm?: false}
  let (:stormy) {double :weather, storm?: true}

  it 'has a flying status when created' do
    expect(plane.airborne?).to eq true
  end

  it 'has a flying status when in the air' do
    plane.land(airport, sunny)
    plane.fly(airport, sunny)
    expect(plane.airborne?).to eq true
  end
  
end