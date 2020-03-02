class Route
  attr_accessor :stations, :last_station, :first_station
  include InstanceCounter

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
    register_instance
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def add_station(station)
      @stations.insert(-2, station)
  end

  def del_stantion(station)
    @stations.delete(station) if station != ( first_station && last_station )
  end

  protected

  def validate!
    raise "First station has invalid format" if @first_station.empty?
    raise "Last station has invalid format" if @last_station.empty?
  end
end
