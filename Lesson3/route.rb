class Route

  attr_accessor :list_of_route, :last_station, :first_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @list_of_route = [@first_station, @last_station]
  end

  def add_stantion(name)
    @list_of_route[-2] = name
  end

  def del_stantion(name)
    @list_of_route.delete_at(name)
  end

  def show_route
    list_of_route.each_with_index { |station, index| puts "#{station} is #{index}" }
  end
end
