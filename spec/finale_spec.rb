require 'airport'
require 'plane'

describe 'Finale' do 

  let (:airport) {Airport.new}
  let (:plane) {Plane.new}
  let (:sunny) {double :weather, storm?: false}

  it 'all planes can land and all planes can take off' do
    planes = Array.new
    10.times {|i| planes[i] = Plane.new}
    10.times {|i| planes[i].land(airport, sunny)}
    10.times {|i| expect(planes[i].airborne?).to eq false}
    10.times {|i| planes[i].fly(airport, sunny)}
    10.times {|i| expect(planes[i].airborne?).to eq true}
  end
end