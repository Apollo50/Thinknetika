class Train
  attr_reader :number, :type, :speed, :wagons, :current_station, :route, :previous_station, :next_station

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
  end

  def speed_up
    @speed += 10
  end

  def brake
    @speed = 0
  end

  def add_wagon(wagon)
    @wagons << wagon if @speed == 0 && @type == wagon.type
  end

  def del_wagon(wagon)
    @wagons.delete(wagon) if @speed == 0 && @type == wagon.type
  end

  def add_route(route)
    @route = route
    route.first_station.take_train(self)
    @current_station = route.first_station
  end

  def move_forward
    if current_station != last_station
      next_st = find_next_station
      current_station.send_train(self)
      next_st.take_train(self)
      @current_station = next_st
    end
  end

  def move_back
    if current_station != first_station
      prev_st = find_previous_station
      current_station.send_train(self)
      prev_st.take_train(self)
      @current_station = prev_st
    end
  end

  def previous_station
    if current_station != first_station
      find_previous_station
      @previous_stat.name
    end
  end

  def next_station
    if current_station != last_station
      find_next_station
      @next_stat.name
    end
  end

# This methods were added in protect, cause they don't used in client code.

  protected

  attr_writer :current_station
  attr_reader :previous_stat, :next_stat

  def current_station?
    @current_station = route.stations.find { |station| station.trains.include?(self) }
  end

  def last_station
    route.last_station
  end

  def first_station
    route.first_station
  end

  def find_previous_station
    @previous_stat = route.stations[route.stations.index(current_station) - 1]
  end

  def find_next_station
    @next_stat = route.stations[route.stations.index(current_station) + 1]
  end
end