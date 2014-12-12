require 'airport'

class Plane

  def initialize
    self.fly
  end

  def airborne?
    @airborne
  end

  def land(airport)
    @airborne = false
    airport.get_plane(self)
  end

  def fly
    @airborne = true
  end

end