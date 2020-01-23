puts 'Please, enter your name:'

name = gets.chomp.capitalize!

puts 'Please, enter your height:'

hight = gets.to_i

idealweight = (hight - 110) * 1.15

if idealweight > 0
  puts "#{name}, your ideal weight is + #{idealweight} kg."
else
  puts "#{name}, you already have ideal weight."
end