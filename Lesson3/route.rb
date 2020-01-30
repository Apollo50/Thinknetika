class Route
  attr_accessor :stations, :last_station, :first_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
  end
  def add_stantion(name)
    @stations[-2] = name
  end
  def del_stantion(name)
    @stations.delete(name)
  end
  def show_route
    @stations.each_with_index { |station, index| puts "#{station} is #{index}" }
  end
end
