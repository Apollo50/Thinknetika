class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end
  def take_train(train)
    trains << train
  end
  def send_train(train)
    if trains.include?(train)
      trains.delete(train)
    end
  end
end