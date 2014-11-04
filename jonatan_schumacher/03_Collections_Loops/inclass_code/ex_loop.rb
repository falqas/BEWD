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

99.downto(0) do |n|

	if (n==1) then container = "bottle"
	else container = "bottles"
	end

	if (n == 0) then n = "No more" end
	puts "#{n} #{container} of beer on the wall"
	puts "#{n} #{container} of beer!"
	unless (n== "No more")
		puts "You take one down and pass it around,"
	end
end

