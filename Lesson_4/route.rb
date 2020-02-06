class Route
  attr_accessor :stations, :last_station, :first_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end
  def add_stantion(name)
    i = @stations.count
    if i <= 2
      @stations << @last_station
      @stations[-2] = name
    else
      @staions[-2] = name
    end
  end
  def del_stantion(name)
    @stations.delete(name)
  end
  def show_route
    @stations.each_with_index { |station, index| puts "#{station.name} is #{index + 1}" }
  end
end
