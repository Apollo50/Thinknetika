puts "Vvedite kooficient A"

a=gets.to_i

puts "Vvedite kooficient B"

b=gets.to_i

puts "Vvedite kooficient C"

c=gets.to_i

d=(b**2-4*a*c)

if d>0
  C=Math.sqrt(d)
  x1=(-b+C)/2*a
  x2=(-b-C)/2*a

  puts "Diskriminant raven " + d.to_s
  puts "x1=" + x1.to_s
  puts "x2=" + x2.to_s
elsif d==0

  C=Math.sqrt(d)
  x1=(-b+C)/2*a
  x2=(-b-C)/2*a

  puts "Diskriminant raven " + d.to_s
  puts "x1=" + x1.to_s
  puts "x2=" + x2.to_s
else
  puts "Diskriminant raven " + d.to_s
  puts "kornei net"
end
