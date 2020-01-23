puts 'Enter value A'
a = gets.to_i

puts 'Enter value B'
b = gets.to_i

puts 'Enter value C'
c = gets.to_i

d = (b**2 - 4 * a * c)

if d > 0
  c = Math.sqrt(d)
  x1 = (- b + c) / 2 * a
  x2 = (- b - c) / 2 * a

  puts "Descriminant is equale #{d}"
  puts "x1 = #{x1}"
  puts "x2 = #{x2}"
elsif d == 0
  c = Math.sqrt(d)
  x1 = (- b + c) / 2 * a
  x2 = (- b - c) / 2 * a

  puts "Descriminant is equale #{d}"
  puts "x1 = #{x1}"
  puts "x2 = #{x2}"
else
  puts "Descriminant is equale #{d}"
  puts 'No roots'
end
