#filename = ARGV.first   # command line argument assign to first -> filename

print "File: "
filename = gets.chomp
txt = open(filename)    # open file

puts "Here's your file #{filename}:"
print txt.read         # print content of file

txt.close
