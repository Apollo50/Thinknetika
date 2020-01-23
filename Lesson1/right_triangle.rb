puts 'Enter side A'

side_a = gets.to_i

puts 'Enter side B'

side_b = gets.to_i

puts 'Enter side C'

side_c = gets.to_i

a, b, c = [side_a, side_b, side_c].sort

if  a == b  &&  a**2 + b**2 == c**2
  puts 'Your triangle is right and isosceles.'
elsif a**2 + b**2 == c**2
  puts 'Your triagle is right.'
elsif a == b && a == c
  puts 'Your triagle is equilateral and isosceles, but not right.'
elsif a == b || b == c
  puts 'Your triagle is isosceles.'
else
  puts 'Your triagle is scalene.'
end


