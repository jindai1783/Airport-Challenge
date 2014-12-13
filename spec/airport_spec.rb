require 'airport'
require 'plane'

describe Airport do 
  let (:airport) {Airport.new}
  let (:plane) {Plane.new}
  let (:plane_air) {double :plane, airborne?: true}
  let (:plane_land) {double :plane, airborne?: false}
  let (:sunny) {double :weather, storm?: false}
  let (:stormy) {double :weather, storm?: true}

  context 'taking off and landing' do 

    it 'a plane can land' do 
      plane.land(airport, sunny)
      expect(airport.count_planes).to eq 1
    end

    it 'a plane can take off' do
      plane.land(airport, sunny)
      plane.fly(airport, sunny)
      expect(airport.count_planes).to eq 0
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      10.times do
        plane.land(airport, sunny)
      end
      expect{plane.land(airport, sunny)}.to raise_error(RuntimeError, 'Airport is full')
    end

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        expect{plane.fly(airport, stormy)}.to raise_error(RuntimeError, 'Storm brewing')
      end

      it 'a plane cannot land in the middle of a storm' do
        expect{plane.land(airport, stormy)}.to raise_error(RuntimeError, 'Cannot land in storm')
      end
    end
  end
end