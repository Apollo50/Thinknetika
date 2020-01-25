basket = {}
sum = 0
sum_for_name = {}

loop do
  puts 'Enter name of goods:'
  name = gets.chomp
  break if name == 'stop'

  if basket.include? name
    puts 'Enter count:'
    count = gets.chomp.to_f
    basket[name]['count'] += count
  else
    puts 'Enter price:'
    price = gets.chomp.to_i
    puts 'Enter count:'
    count = gets.chomp.to_f
    basket[name] = { 'price' => price, 'count' => count }
  end
end

basket.each do | name, inner_hash |
  sum += inner_hash['price'] * inner_hash['count']
  sum_for_name[name] = sum
end

puts "Total summ for each product:  #{sum_for_name}"
puts "Total summ for  basket: #{sum}"
