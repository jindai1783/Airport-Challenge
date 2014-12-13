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
    if !full?
      if !weather.storm?
        planes << plane
      else
        raise'Cannot land in storm'
      end
    else
      raise 'Airport is full'
    end
	end

	def bye_plane(plane, weather)
    if !weather.storm?
		  planes.delete(plane)
    else
      raise 'Storm brewing'
    end
  end

end