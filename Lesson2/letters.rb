let = {}

i = 1

('a'..'z').each do |x|
  let[x] = i
  i += 1
end

vowel = 'eyuioa'
vowel_hash = {}

let.each do |letter, key|
  if vowel.include?(letter)
  vowel_hash[letter] = key
  end
end

puts vowel_hash
