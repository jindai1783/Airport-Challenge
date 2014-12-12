require 'airport'

class Plane

  def initialize
    self.airborne!
  end

  def airborne!
    @airborne = true
  end

  def airborne?
    @airborne
  end

  def land(airport)
    @airborne = false
    airport.get_plane(self)
  end

  def fly(airport)
    @airborne = true
    airport.bye_plane(self)
  end

end