class Train
  attr_reader :number, :type, :speed, :wagons, :current_station, :route

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
      route.stations.each_with_index do |station, index|
        if station.trains.include?(self) && station != self.last_station
          current_station.send_train(self)
          self.current_station = self.route.stations[index + 1]
          current_station.take_train(self)
          break
        end
      end
  end
  def move_back
    route.stations.each_with_index  do |station, index |
      if station.trains.include?(self) && station != self.first_station
        current_station.send_train(self)
        self.current_station = self.route.stations[index - 1]
        current_station.take_train(self)
        break
      end
    end
  end
  def show_station
    self.route.stations.each_with_index  do |station, index|
      puts "#{index + 1} is #{station.name} and include Trains: #{station.trains}"
    end
  end

# This methods were added in protect, cause they don't used in client code.

  protected
  attr_writer :current_station
  attr_reader :previous_stat, :next_stat

  def last_station
    route.last_station
  end
  def first_station
    route.first_station
  end
  def find_previous_station
    route.stations.each_with_index  do |station, index|
      @previous_stat = @route.stations[index - 1] if station != self.first_station && station.trains.include?(self)
    end
  end
  def previous_station
    @previous_stat.name
  end
  def find_next_station
    route.stations.each_with_index  do |station, index|
      @next_stat = self.route.stations[index + 1] if station != self.last_station && station.trains.include?(self)
    end
  end
  def next_station
    @next_stat.name
  end
  end