puts 'Enter day:'
day = gets.chomp.to_i

puts 'Enter month:'
month = gets.chomp.to_i

puts 'Enter year:'
year = gets.chomp.to_i

day_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

sum = 0

(0..month - 2).each  { |mn| sum += day_month[mn] }

sum += day

if year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0 ) && month > 2
  sum += 1
end

puts sum