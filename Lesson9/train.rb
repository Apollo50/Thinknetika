# frozen_string_literal: true

# Train class
class Train
  attr_reader :number, :type, :speed, :wagons, :current_station, :route
  include Maker
  include InstanceCounter
  include Validation

  @@trains = {}
  VALIDATE_NUMBER = /^(\d|\D){3}\p{pD}?(\d|\D){2}$/i.freeze

  validate :number, :presence
  validate :number, :format, VALIDATE_NUMBER
  validate :type, :presence

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    validate!
    @@trains[number] = self
    register_instance
  end

  def self.find(number)
    @@trains[number]
  end

  def speed_up
    @speed += 10
  end

  def brake
    @speed = 0
  end

  def add_wagon(wagon)
    @wagons << wagon if @speed.zero? && @type == wagon.type
  end

  def del_wagon(wagon)
    @wagons.delete(wagon) if @speed.zero? && @type == wagon.type
  end

  def add_route(route)
    @route = route
    route.first_station.take_train(self)
    @current_station = route.first_station
  end

  def move_forward
    if current_station != last_station
      next_station = find_next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @current_station = next_station
    end
  end

  def move_back
    if current_station != first_station
      previous_station = find_previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @current_station = previous_station
    end
  end

  def previous_station
    find_previous_station if current_station != first_station
  end

  def next_station
    find_next_station if current_station != last_station
  end

  def each_wagon(&block)
    @wagons.each { |wagon| block.call(wagon) } if block_given?
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
    @previous_station = route.stations[route.stations.index(current_station) - 1]
  end

  def find_next_station
    @next_station = route.stations[route.stations.index(current_station) + 1]
  end
end
