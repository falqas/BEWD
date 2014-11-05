# Write a program that prints 99 bottles of beer on the wall.
# The song starts with
# 99 bottles of beer on the wall
# 99 bottles of beer!
# You take one down and pass it around,
# 98 bottles of beer on the wall!
#
# And ends with
# 1 bottle of beer on the wall
# 1 bottle of beer!
# You take one down and pass it around,
# No more bottles of beer on the wall :-(

99.downto(2) do |iteration_number|

	puts "#{iteration_number} bottles of beer on the wall #{iteration_number} bottles of beer!"

	puts "You take one down and pass it around, #{iteration_number-1} bottles of beer on the wall!"

end

puts '1 bottle of beer on the wall, 1 bottle of beer.'
puts 'Take one down, pass it around, 0 bottles of beer on the wall ... ?!'
puts 'Time for a beer run!!'.upcase