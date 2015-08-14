first, second, third, fourth = ARGV #Take whatever is in ARGV, unpack it, and assign it to all of these variables on the left in order

puts "Your first variable is: #{first}"
puts "Your second variable is: #{second}"
puts "Your third variable is: #{third}"
puts "Your fourth variable is: #{fourth}"

first = first.to_i
second = second.to_i
third = third.to_i
fourth = fourth.to_i

print "Add a number: "
number = STDIN.gets.chomp.to_i

sum = first + second + third + fourth + number

puts "The sum of #{first} + #{second} + #{third} + #{fourth} + #{number} = #{sum} "
