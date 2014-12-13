require 'plane'

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

	def get_plane(plane)
    if !full?
      planes << plane
    else
      raise 'Airport is full'
    end
	end

	def bye_plane(plane)
		planes.delete(plane)
  end

end