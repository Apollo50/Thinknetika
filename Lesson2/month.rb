hash = {}

hash[:janvary] = 31
hash[:february] = 28
hash[:marth] = 31
hash[:april] = 30
hash[:may] = 31
hash[:june] = 30
hash[:july] = 31
hash[:august] = 31
hash[:september] = 30
hash[:october] = 31
hash[:november] = 30
hash[:december] = 31

hash.each do |month, days|
  if days == 30
    puts month
  end
end
