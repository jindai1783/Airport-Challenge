require 'airport'
require 'weather'

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

  def land(airport, weather)
    weather ||= Weather.new
    airport.get_plane(self, weather)
    @airborne = false
  end

  def fly(airport, weather)
    weather ||= Weather.new
    airport.bye_plane(self, weather)
    @airborne = true
  end

end