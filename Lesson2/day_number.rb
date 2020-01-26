puts 'Enter day:'
day = gets.chomp.to_i

puts 'Enter month:'
month = gets.chomp.to_i

puts 'Enter year:'
year = gets.chomp.to_i

day_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
day_month[1] = 29 if year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0 ) && month > 2

# Избавился от sum += 1 if year % 400 == 0 || ( year % 4 == 0 && year % 100 != 0 ) && month > 2
# т.к для ( 2000, 2400 и т.д) годов, выдает неправильный результат.

sum = day_month.take(month - 1).sum
sum += day

puts sum