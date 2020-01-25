fib = [0,1]
i = 2

while fib[-1] < 100
  fib2 = fib[i - 1] + fib[i - 2]
  fib << fib2
  i += 1
end

puts fib