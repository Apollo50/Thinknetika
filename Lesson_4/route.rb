class Route
  attr_accessor :stations, :last_station, :first_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
  end

  def add_station(station)
      @stations.insert(-2, station)
  end

  def del_stantion(station)
    @stations.delete(station) if station != ( first_station && last_station )
  end
end
