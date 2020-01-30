class Train
  attr_accessor :route
  attr_reader :number, :type, :speed

  def initialize(number, type, number_of_wagons)
    @number = number
    @type = type
    @number_of_wagons = number_of_wagons
    @speed = 0
  end
  def speed_up
    @speed += 10
  end
  def brake
    @speed = 0
  end
  def add_wagon
    self.number_of_wagons += 1 if speed == 0
  end
  def del_wagon
    self.number_of_wagons -= 1 if @speed == 0 && self.number_of_wagons > 0
  end
  def add_route(route)
    self.route = route
    route.first_station.take_train(self)
  end
  def move_forward
    self.route.stations.each_with_index  do |station, index|
      if station.trains.include?(self) && station != self.route.last_station
        station.send_train(self)
        self.route.stations[index + 1].take_train(self)
        break
      end
    end
  end
  def move_back
    self.route.stations.each_with_index  do |station, index |
      if station.trains.include?(self) && station != self.route.first_station
        station.send_train(self)
        self.route.stations[index - 1].take_train(self)
        break
      end
    end
  end
  def show_station
    self.route.stations.each_with_index  do |station, index |
      if station.trains.include?(self)
        prev_stat = self.route.stations[index - 1]
        curr_stat = self.route.stations[index]
        next_stat = self.route.stations[index + 1]
      end
    end
  end
end
