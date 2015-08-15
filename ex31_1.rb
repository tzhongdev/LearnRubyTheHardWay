puts "You enter a forest. There are two ways. Do you want to go way 1 or 2?"

print ">"
way = $stdin.gets.chomp

if way == "1"
  puts "There is slender man"
  puts "1. find the eight pages"
  puts "2. sing taylor swift"

  print "> "
  slender = $stdin.gets.chomp

  if slender == "1"
    puts "You just found 6 pages. Slender scares you to death"
  elsif slender == "2"
    puts "Slender apologizes and goes away"
  else puts "I can wait"
  end

elsif way == "2"
  puts "There is Wolle Petry"
  puts "1. \"Das is Wahnsinn warum schickst du mich in die....\""
  puts " 2. KILL YOURSELF"

  print "> "
  wolle = $stdin.gets.chomp

  if wolle == "Hölle, Hölle, Hölle"
    puts "He likes you. Good job!"
  else
    puts "GOOD DECISION"
  end
else
  puts "So I can wait.........."
end


