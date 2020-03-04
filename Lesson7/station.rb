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
    validate!
    register_instance
  end

  def take_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train) if trains.include?(train)
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def each_train(&block)
    if block_given?
      trains.each { |train| block.call(train)}
    end
  end

  protected

  def validate!
    raise "Name has invalid format" if @name.empty?
  end
end