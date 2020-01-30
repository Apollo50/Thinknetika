class Train

  attr_accessor :speed, :number_of_wagons, :location
  attr_reader :number, :type
  def initialize(number, type, number_of_wagons)
    @train_number = number
    @train_type = type
    @number_of_wagons = number_of_wagons
    @speed = 0
  end

  def speed_up
    @speed += 10
    puts "Too too. Your speed is #{@speed}."
  end

  def brake
    @speed = 0
    puts 'You have stopped.'
  end

  def add_wagon
    if speed == 0
      self.number_of_wagons += 1
      puts "The number of wagons of your train is/are #{self.number_of_wagons}"
    else
      puts "You can not add a wagon. Your speed is #{@speed}. Please brake before adding."
    end
  end

  def del_wagon
    if @speed == 0 && self.number_of_wagons > 0
      self.number_of_wagons -= 1
    else
      puts "You can't delete a wagon. Your speed is #{@speed}." if @speed != 0
      puts "You can't delete a wagon. The length of the train is #{self.number_of_wagons}." if self.number_of_wagons == 0
    end
  end

  def add_route(route)
    @list_of_route = route
    self.location = route.first_station.name
    route.first_station.take_train(self)
  end

  def move_forward
    @list_of_route.each_with_index  do |station, index|
      if self.location == station && route.last_station.name != self.location
        station.send_train(self)
        route.list_of_route[index + 1].take_train(self)
        break
      end
    end
  end


  def move_back
    @list_of_route.each_with_index  do |station, index |
      if self.location == station && route.first_station.name != self.location
        station.send_train(self)
        route.list_of_route[index - 1].take_train(self)
        break
      end
    end
  end

  def show_station
    @list_of_route.each_with_index  do |station, index |
      if self.location == station
        puts "The previous station is #{@list_of_route[index - 1]}."
        puts "The current station is #{@list_of_route[index]}."
        puts "The next station is #{@list_of_route[index + 1]}."
      end
    end
  end

end
