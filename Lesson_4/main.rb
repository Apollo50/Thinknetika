require_relative "./train.rb"
require_relative "./passenger_train.rb"
require_relative "./carg_train.rb"

require_relative "./wagon.rb"
require_relative "./passenger_wagon.rb"
require_relative "./cargo_wagon.rb"

require_relative "./route.rb"
require_relative "./station.rb"

class MainMenu

  Main_menu = '                        Main menu
                    1 - Station actions
                    2 - Train actions
                    3 - Route actions
                    4 - Exit'
  Station_menu = '                        Station menu
                    1 - Create new station
                    2 - Look all stations
                    3 - Look list of trains on each stations
                    4 - Back to main menu'

  Train_menu = '                        Train menu
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

  Route_menu = '                        Route menu
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
    loop do
      puts Main_menu
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
  end

  def station_actions
    puts Station_menu
    print '=>'
    x = gets.to_i
    case x
    when 1
      puts "Enter station name"
      station_name = gets.chomp
      if @stations.include?(station_name)
        puts "Station #{station_name} already exists"
      else
        @stations << Station.new(station_name)
        puts "Station #{station_name} successfully created"
      end
    when 2
      @stations.each { |station| puts station.name }
    when 3
      if @stations.empty?
        puts "Station list is empty"
      else
        puts "Select the station!"
        @stations.each_with_index { |station, index| puts "#{index} - #{station.name}" }
        print '=>'
        index = gets.to_i
        @stations[index].trains.each { |train| puts "Train #{train.number} type #{train.type}" }
      end
    when 4
      start_menu
    end
  end

  def train_actions
    puts Train_menu
    print '=>'
    x = gets.to_i
    if x == 1
      add_new_train
    else
      puts "Select the train."
      @trains.each_with_index { |train, index| puts "#{index} - Train #{train.number}" }
      print '=>'
      index = gets.to_i
      @selected_train = @trains[index]
    end
    case x
    when 2
      puts "Previous station is #{@selected_train.previous_station}"
      puts "Next station is #{@selected_train.next_station}"
      puts "Current station is #{@selected_train.current_station.name}"
      puts "Numbers of wagon is #{@selected_train.wagons.count}"
      puts "Current speed is #{@selected_train.speed}"
    when 3
      @selected_train.add_wagon(PassengerWagon.new) if @selected_train.type == "pass"
      @selected_train.add_wagon(CargoWagon.new) if @selected_train.type == "cargo"
      puts "New wagon was successfully added."
    when 4
      @selected_train.del_wagon(@selected_train.wagons.last)
      puts "Last wagon was deleted."
    when 5
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
    when 6
      @selected_train.brake
      puts "Train was stopped."
    when 7
      @selected_train.speed_up
      puts "Train speed was increased. Current speed is #{@selected_train.speed}"
    when 8
      puts "Next station is #{@selected_train.next_station}. Be careful, doors are closing."
      @selected_train.move_forward
      puts "Train arrived on station #{@selected_train.current_station.name}."
    when 9
      puts "Next station is #{@selected_train.previous_station}. Be careful, doors are closing."
      @selected_train.move_back
      puts "Train arrived on station #{@selected_train.current_station.name}."
    when 10
      start_menu
    end
    train_actions
  end

  def route_actions
    puts Route_menu
    x = gets.to_i
    if x == 1
      add_new_route
    else
      puts "Select the route"
      @routes.each_with_index { |route, index| puts "#{index} : #{route.first_station.name} - #{route.last_station.name}" }
      print '=>'
      index = gets.to_i
      @selected_route = @routes[index]
    end
    case x
    when 2
      @selected_route.show_route
    when 3
      puts "Select station"
      @stations.each_with_index { |station, index| puts "#{index} - #{station.name}" }
      print '=>'
      index = gets.to_i
      @selected_route.add_station(@stations[index])
      puts "Station was successfully added."
    when 4
      puts "Select station."
      @selected_route.stations.each_with_index { |station, index| "#{index} - #{station.name}" }
      print '=>'
      index = gets.to_i
      @selected_route.add_station(@selected_route.stations[index])
      puts "Station was deleted."
    when 5
      start_menu
    end
    route_actions
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
end

a = MainMenu.new
a.start_menu