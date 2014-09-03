number = rand(10) + 1

puts "Omg I can write Ruby this is amaze"
puts "-" * "Omg I can write Ruby this is amaze".length
puts

won = false

5.times do
  print "Guess a number yeah (1..10) > "
  guess = gets.to_i

  if number == guess
    won = true
    break
  else
    puts "Nopes"
  end
end

if won
  puts "Omg you are amaze you guessed it good, it was #{number}"
else
  puts "Nopes, the correct number was #{number}"
end
