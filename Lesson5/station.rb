class Station
  attr_reader :name, :trains
  include InstanceCounter
  @@all_stations = []

  def self.all
    return @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def take_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train) if trains.include?(train)
  end

end