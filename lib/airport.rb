require 'plane'

class Airport

  def planes
    @planes ||= []
  end

	def count_planes
    planes.count
	end

	def get_plane(plane)
    planes << plane
	end

	def bye_plane(plane)
		planes.delete(plane)
  end

end