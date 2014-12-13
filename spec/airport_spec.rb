require 'airport'
require 'plane'

describe Airport do 
  let (:airport) {Airport.new}
  let (:plane) {Plane.new}
  let (:plane_air) {double :plane, airborne?: true}
  let (:plane_land) {double :plane, airborne?: false}

  context 'taking off and landing' do 

    it 'a plane can land' do 
      plane.land(airport)
      expect(airport.count_planes).to eq 1
    end

    it 'a plane can take off' do
      plane.land(airport)
      plane.fly(airport)
      expect(airport.count_planes).to eq 0
    end

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      10.times do
        plane.land(airport)
      end
      expect{plane.land(airport)}.to raise_error(RuntimeError, 'Airport is full')
    end

    context 'weather conditions' do

      xit 'a plane cannot take off when there is a storm brewing' do
      end

      xit 'a plane cannot land in the middle of a storm' do
      end
    end
  end
end