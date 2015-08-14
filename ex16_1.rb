filename = ARGV.first                         # assign file to filename

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C."
puts "If you do watn that, hit RETURN."

$stdin.gets

puts "Opening the file..."
target = open(filename, 'w')                  # opens file and create file object assigned to target

#puts "Truncating the file. Goodbye!"
#target.truncate(0)                            # erase file content

puts "Now I'm going to ask you for three line."

print "line 1: "
line1 = $stdin.gets.chomp
print "line2: "
line2 = $stdin.gets.chomp
print "line3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

#target.write(line1)                           # write 3 lines to file
#target.write("\n")
#target.write(line2)
#target.write("\n")
#target.write(line3)
#target.write("\n")
target.write(line1 + "\n" + line2 + "\n" + line3 + "\n")

puts "Contend of File: "
target = open(filename, 'r')
print target.read

puts "And finally, we close it."
target.close
