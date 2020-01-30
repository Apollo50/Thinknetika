class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = {}
    puts "Station #{name} was added."
  end

  def list
    puts " On the station there are #{ self.trains.each { |number, type | puts "Train #{number}, #{type} type." } }"
  end

  def list_type
    count_cargo = 0
    count_pass = 0
    self.trains.each do |number, type|
      count_cargo += 1 if type == "cargo"
      count_pass += 1 if type == "pass"
    end
    puts " On the station there're #{count_cargo} trains cargo type."
    puts " On the station there're #{count_pass} trains passenger type."
  end

  def take_train(number, type)
    self.trains[number] = type
    train.location = self.station.name
    puts "Train #{number} arrived on the station"
  end

  def send_train(number)
    if self.trains.include?(number)
      self.trains.delete_at(number)
      puts "Train #{number} departed the station."
    else
      puts "The train #{number} isn't on the station"
    end
  end

end
