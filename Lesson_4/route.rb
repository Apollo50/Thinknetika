class Route
  attr_accessor :stations, :last_station, :first_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
  end

  def add_station(station)
    i = @stations.count
    if i <= 2
      @stations << @last_station
      @stations[-2] = station
    else
      @staions[-2] = station
    end
  end

  def del_stantion(station)
    @stations.delete(station)
  end
end
