vowel_hash = {}
vowel = 'eyuioa'

('a'..'z').each_with_index do |letter, index|
  if vowel.include?(letter)
    vowel_hash[letter] = index + 1
  end
end

puts vowel_hash
