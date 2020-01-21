puts "Vvedite znachenie 1oi storoni treugolnika:"

a=gets.to_i

puts "Vvedite znachenie 2oi storoni treugolnika:"

b=gets.to_i

puts "Vvedite znachenie 3ei storoni treugolnika:"

c=gets.to_i

new_array=[]
new_array[0]=a
new_array[1]=b
new_array[2]=c

sort_arr= new_array.sort

s=sort_arr[0]
m=sort_arr[1]
l=sort_arr[2]



if  s==m &&  s**2+m**2==l**2

  puts "U vas pryamougol'ni ravnobedrenni treugol'nik"

elsif s**2+m**2==l**2

  puts "U vas  pryamougol'ni treugol'nik"

elsif s==m && s==l

  puts "Treugol'nik ravnostoronnii i ravnobedrennni , no ne ptyamougol'ni"

elsif s==m || m==l
  puts " U vas ravnobedrenni treugol'nik"

else
  puts "U vas raznostoronnii treugol'nik"
end


