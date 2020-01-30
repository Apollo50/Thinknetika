class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = {}
  end
  def list_type
    count_cargo = self.trains.count { |number, type| type == "cargo" }
    count_pass = self.trains.count { |number, type| type == "pass" }
  end
  def take_train(number, type)
    self.trains[number] = type
  end
  def send_train(number)
    if self.trains.include?(number)
      self.trains.delete(number)
    end
  end
end
