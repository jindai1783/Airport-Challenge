require 'airport'
require 'plane'

describe Airport do 
  let (:airport) {Airport.new}
  let (:plane) {Plane.new}
  let (:sunny) {double :weather, storm?: false}
  let (:stormy) {double :weather, storm?: true}

  context 'Taking off and landing' do
    it 'A plane can land' do
      plane.land(airport, sunny)
      expect(airport.count_planes).to eq 1
    end

    it 'A plane can take off' do
      plane.fly(airport, sunny)
      expect(airport.count_planes).to eq 0
    end
  end

  context 'ATC' do
    it 'A plane cannot land when airport is full' do
      15.times {plane.land(airport, sunny)}
      expect(airport.count_planes).to eq airport.capacity
    end

    context 'Weather conditions' do
      it 'A plane cannot take off in storm' do
        plane.land(airport, sunny)
        plane.fly(airport, stormy)
        expect(airport.count_planes).to eq 1
      end

      it 'A plane cannot land in storm' do
        plane.land(airport, stormy)
        expect(airport.count_planes).to eq 0
      end
    end
  end
end
