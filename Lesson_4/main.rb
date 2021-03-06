require_relative "./train.rb"
require_relative "./passenger_train.rb"
require_relative "./carg_train.rb"

require_relative "./wagon.rb"
require_relative "./passenger_wagon.rb"
require_relative "./cargo_wagon.rb"

require_relative "./route.rb"
require_relative "./station.rb"

class MainMenu

  MAIN_MENU = '                        Main menu
                    1 - Station actions
                    2 - Train actions
                    3 - Route actions
                    4 - Exit'
  STATION_MENU = '                        Station menu
                    1 - Create new station
                    2 - Look all stations
                    3 - Look list of trains on each stations
                    4 - Back to main menu'

  TRAIN_MENU = '                        Train menu
                    1 - Create new train
                    2 - Train info
                    3 - Add wagon to train
                    4 - Delete wagon to train
                    5 - Add route to train
                    6 - Stop train
                    7 - Speed up train
                    8 - Move to next station
                    9 - Move to previous station
                    10 - Back to main menu'

  ROUTE_MENU = '                        Route menu
                    1 - Create new route
                    2 - Show all stations
                    3 - Add new station
                    4 - Delete station
                    5 - Back to main menu'

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def start_menu
    puts MAIN_MENU
    print '=>'
    x = gets.to_i
    case x
    when 1
      station_actions
    when 2
      train_actions
    when 3
      route_actions
    when 4
      exit
    end
  end

  protected

  def station_actions
    puts STATION_MENU
    print '=>'
    x = gets.to_i
    case x
    when 1
      create_station
    when 2
      look_station
    when 3
      look_trains
    when 4
      start_menu
    end
    station_actions
  end

  def train_actions
    puts TRAIN_MENU
    print '=>'
    x = gets.to_i
    if x == 1
      add_new_train
    else
      select_train
    end
    case x
    when 2
      train_info
    when 3
      add_wagon
    when 4
      delete_wagon
    when 5
      add_route
    when 6
      stop_train
    when 7
      speed_up
    when 8
      move_forward
    when 9
      move_back
    when 10
      start_menu
    end
    train_actions
  end

  def route_actions
    puts ROUTE_MENU
    x = gets.to_i
    if x == 1
      add_new_route
    else
      select_route
    end
    case x
    when 2
      show_route
    when 3
      increase_route
    when 4
      reduce_route
    when 5
      start_menu
    end
    route_actions
  end

  def create_station
    puts "Enter station name"
    station_name = gets.chomp
    if @stations.include?(station_name)
      puts "Station #{station_name} already exists"
    else
      @stations << Station.new(station_name)
      puts "Station #{station_name} successfully created"
    end
  end

  def look_station
    @stations.each { |station| puts station.name }
  end

  def look_trains
    if @stations.empty?
      puts "Station list is empty"
    else
      puts "Select the station!"
      @stations.each_with_index { |station, index| puts "#{index} - #{station.name}" }
      print '=>'
      index = gets.to_i
      @stations[index].trains.each { |train| puts "Train #{train.number} type #{train.type}" }
    end
  end

  def select_train
    puts "Select the train."
    @trains.each_with_index { |train, index| puts "#{index} - Train #{train.number}" }
    print '=>'
    index = gets.to_i
    @selected_train = @trains[index]
  end

  def add_new_train
    puts "Enter train number"
    print '=>'
    train_number = gets.chomp
    puts "Chose train type
        1 - Passenger
        2 - Cargo"
    train_type = gets.to_i
    case train_type
    when 1
      @trains << PassengerTrain.new(train_number)
    when 2
      @trains << CargoTrain.new(train_number)
    end
    puts "Train #{train_number} successfully created "
    train_actions
  end

  def train_info
    puts "Previous station is #{@selected_train.previous_station.name}"
    puts "Next station is #{@selected_train.next_station.name}"
    puts "Current station is #{@selected_train.current_station.name}"
    puts "Numbers of wagon is #{@selected_train.wagons.count}"
    puts "Current speed is #{@selected_train.speed}"
  end

  def add_wagon
    @selected_train.add_wagon(PassengerWagon.new) if @selected_train.type == "pass"
    @selected_train.add_wagon(CargoWagon.new) if @selected_train.type == "cargo"
    puts "New wagon was successfully added."
  end

  def delete_wagon
    @selected_train.del_wagon(@selected_train.wagons.last)
    puts "Last wagon was deleted."
  end

  def add_route
    if @routes.empty?
      puts "Route list is empty, please create new route."
    else
      puts "Select the route."
      @routes.each_with_index { |route, index| puts "#{index} : #{route.first_station.name} - #{route.last_station.name}" }
      print '=>'
      index = gets.to_i
      @selected_train.add_route(@routes[index])
      puts "Route was successfully added"
    end
  end

  def stop_train
    @selected_train.brake
    puts "Train was stopped."
  end

  def speed_up
    @selected_train.speed_up
    puts "Train speed was increased. Current speed is #{@selected_train.speed}"
  end

  def move_forward
    puts "Next station is #{@selected_train.next_station.name}. Be careful, doors are closing."
    @selected_train.move_forward
    puts "Train arrived on station #{@selected_train.current_station.name}."
  end

  def move_back
    puts "Next station is #{@selected_train.previous_station.name}. Be careful, doors are closing."
    @selected_train.move_back
    puts "Train arrived on station #{@selected_train.current_station.name}."
  end

  def select_route
    puts "Select the route"
    @routes.each_with_index { |route, index| puts "#{index} : #{route.first_station.name} - #{route.last_station.name}" }
    print '=>'
    index = gets.to_i
    @selected_route = @routes[index]
  end

  def add_new_route
    puts "Add first station and last station to route."
    puts "Select first station."
    @stations.each_with_index { |station, index| puts "#{index} - #{station.name}" }
    first_station = gets.to_i
    puts "Select last station."
    last_station = gets.to_i
    @routes << Route.new(@stations[first_station], @stations[last_station])
    puts "Route was successfully created."
    route_actions
  end

  def show_route
    @selected_route.show_route
  end

  def increase_route
    puts "Select station"
    @stations.each_with_index { |station, index| puts "#{index} - #{station.name}" }
    print '=>'
    index = gets.to_i
    @selected_route.add_station(@stations[index])
    puts "Station was successfully added."
  end

  def reduce_route
    puts "Select station."
    @selected_route.stations.each_with_index { |station, index| "#{index} - #{station.name}" }
    print '=>'
    index = gets.to_i
    @selected_route.add_station(@selected_route.stations[index])
    puts "Station was deleted."
  end
end

a = MainMenu.new
a.start_menu