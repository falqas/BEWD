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

99.downto(2) do |n|
	puts "#{n} bottles of beer on the wall \n #{n} bottles of beer!"

	puts "You take one down and pass it around, \n #{n-1} bottle of beer on the wall!"
end
	puts "1 bottle of beer on the wall \n 1 bottle of beer! \n You take one down and pass it around, No more bottles of beer on the wall :-("

