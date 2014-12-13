require 'plane'
require 'weather'

class Airport

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= 10
  end

  def full?
    capacity == count_planes
  end

	def count_planes
    planes.count
	end

	def get_plane(plane, weather)
    planes << plane if !full? && !weather.storm?
	end

	def bye_plane(plane, weather)
    planes.delete(plane) if !weather.storm?
  end
end