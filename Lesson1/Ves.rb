puts "Please, enter your name:"

name=gets.chomp.capitalize!

puts "Vvedite vash rost:"

hight=gets.to_i



idealweight=(hight-110)*1.15

if idealweight > 0

puts name.to_s + ", vash ideal'ni ves" + " " + idealweight.to_s + "kg"

else
  puts name.to_s + ", budem radi vam soobshit', vash ves  optimalen"
  end