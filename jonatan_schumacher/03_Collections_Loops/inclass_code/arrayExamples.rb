presidents = ["George", "John", "Thomas"]
presidents.reverse

puts presidents.size
puts presidents.length
puts presidents.count

presidents.push("Obama")

array_of_presidents = presidents.map do |word| 
	"Mr. #{word}"
end

array_of_presidents.each { |x| puts x }