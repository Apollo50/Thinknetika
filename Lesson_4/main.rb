require_relative "./train.rb"
require_relative "./passenger_train.rb"
require_relative "./carg_train.rb"

require_relative "./wagon.rb"
require_relative "./passenger_wagon.rb"
require_relative "./cargo_wagon.rb"

require_relative "./route.rb"
require_relative "./station.rb"

puts '************ INVENT ************'

wg1pass = PassengerWagon.new(111)
wg2pass = PassengerWagon.new(211)
wg3pass = PassengerWagon.new(311)

wg1cargo = CargoWagon.new(122)
wg2cargo = CargoWagon.new(222)
wg3cargo = CargoWagon.new(322)

st1 = Station.new("minsk")
st2 = Station.new("vitebsk")
st3 = Station.new("gomel")
st4 = Station.new("brest")
st5 = Station.new("mogilev")
st6 = Station.new("grodno")

rt1 = Route.new(st1,st2)
rt2 = Route.new(st4,st5)

tr1pass = PassengerTrain.new(1011)
tr1cargo = CargoTrain.new(1022)

rt1.add_stantion(st3)
rt1.del_stantion(st3)
rt1.add_stantion(st3)
rt1.stations

rt2.add_stantion(st6)
rt2.stations

tr1pass.add_wagon(wg1pass)
tr1pass.add_wagon(wg2pass)
tr1pass.add_wagon(wg3pass)
tr1pass.del_wagon(wg3pass)
tr1pass.add_wagon(wg1cargo)
tr1pass.wagons

tr1cargo.add_wagon(wg1cargo)
tr1cargo.add_wagon(wg2cargo)
tr1cargo.add_wagon(wg3cargo)
tr1cargo.del_wagon(wg3cargo)
tr1cargo.add_wagon(wg1pass)
tr1cargo.wagons

tr1pass.add_route(rt1)
tr1cargo.add_route(rt2)

tr1pass.show_station
tr1cargo.show_station

tr1pass.move_forward
tr1pass.current_station.name
tr1pass.move_forward
tr1pass.current_station.name
tr1pass.current_station.trains
tr1pass.show_station

tr1pass.move_back
tr1pass.current_station.name
tr1pass.move_back
tr1pass.current_station.name
tr1pass.current_station.trains
tr1pass.show_station
