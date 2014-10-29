<img id="icon" src="https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png">

#BEWD - Collections, Loops & APIs


---


##Agenda

*	Recap
	*	Quick Fire (fizzbuzz time!!)
*	Practical Application Of Collections & Loops (APIs)
*	Lab Time

---

<img id ='icon' src="assets/ICL_icons/Exercise_icon_md.png">
##Quick Fire - Fizz Buzz

---

##Quick Fire
###Fizz Buzz

TIME : 30 min

*	Write a program that prints numbers from 1 to 100.

*	But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”.

*	For numbers which are multiples of both three and five print “FizzBuzz”.

---

##Recap

*	Variables
*	Conditionals
*	Iteration
*	Collections

---

## Ranges

Ranges represent a sequence of numbers (in ascending order). They are denoted by `..` or `...` (the latter makes the sequence go up to one less than the last number defined)

```ruby
1..10
1...10
```

Ranges can easily be converted to arrays if needed:

```ruby
(1..10).to_a
#=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
(1...10).to_a
#=> [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

---

## Iteration

We've seen `while`, `until`, `upto`, `downto`, but what about when we want to iterate over a collection (like an array)?

---

## Iteration - Before
__upto or downto__

```ruby
range = 1..10
range.min.upto(range.max) do |n|
  puts "This is iteration number #{n}"
end
```

or

```ruby
cats = ['Otto', 'Luna', 'Garfield']
1.upto(cats.size) |n|
  puts cats[n - 1]
end
```

![wtf](http://i.imgur.com/IBN2l.gif)

---

## Iteration - After
__each__

```ruby
range = 1..10
range.each do |n|
  puts "This is iteration number #{n}"
end
```

or

```ruby
cats = ['Otto', 'Luna', 'Garfield']
cats.each do |cat|
  puts cat
end
```

![better](http://i.imgur.com/VL4sUSC.gif)

---

# What about hashes?

---

## Iteration - Hashes

```ruby
otto = { first_name: 'Otto', color: 'Grey' }

otto.each do |key, value|
  puts "#{key}: #{value}"
end
```

---

## Map

`.each` works great when you want to simply iterate over a collection and do something to each element, but the return value is simply thrown away.

`.map` is for when you want to save the return value, and essentially, map each element of the collection to a new value.

---

## Map

```ruby
cats = [
  {name: 'Otto', color: 'Black'},
  {name: 'Luna', color: 'Grey'}
]

cats.map do |cat|
  cat[:name]
end
#=> ['Otto', 'Luna']
```

---

# What about hashes?

---

## Mapping over Hashes

```ruby
instructor = {
  first_name: 'Sandip',
  last_name: 'Trivedi'
}

instructor.map do |key, value|
  value
end
#=> ['Sandip', 'Trivedi']
```

---

## Each & Map Exercise
[![exercise](https://www.dropbox.com/s/do5viuc8pas6orh/exercise.png?dl=1)](https://materials.generalassemb.ly/bewd/13/lessons/4#classwork)

---

##Working With Collections
###Let's get practical

---

##APIs
###Application Programming Interface

---

##APIs
###Working with APIs

1. Ask for some data
2. Convert it into a format we can work with
3. Do cool stuff

---

## APIs

__Application Programming Interface__

A way to programmatically get and send data to a service (like Facebook, Twitter, Reddit, etc)

- The most popular way is a JSON REST API

---

## But how do you use an API in Ruby?

---

## Why an HTTP Client, of course!

HTTP clients offer a way to interact with the internet, but via code.

How do you use one?

---

# Enter... the Gem.

---

## Gems

Gems can be thought of as a package of code that another developer has written before, and published for the world to use.

They can be installed by typing `gem install <gemname>` in your terminal.

---

## Our Second Gem

We've already installed one gem before, `pry`, which helps us test things out in an interactive ruby console.

Let's install our second gem, an HTTP client, that will help us query APIs from the internet:

```bash
gem install rest-client
```

---

## [RestClient](https://github.com/rest-client/rest-client)

```
require 'rest-client'

url = 'http://www.google.com'
google = RestClient.get(url)
```

Give it a try

---

Unfortunately, raw HTML isn't the best form of data for us to use and manipulate

---

## JSON

JSON: Javascript Object Notation

A structure formatting of data that many engineers have settled on. It roots from Javascript, but despite it being in another language, Ruby has a built in parser.

The `JSON` library can be thought of as a "built in" gem. All you need to do is the following:

```
require 'rest-client'
require 'json'

url = 'username:password@https://api.github.com/users/strivedi183/repos'
response = RestClient.get(url)
parsed_response = JSON.parse(response)
```

---

##Do Cool Stuff
<img id ='icon' src="assets/ICL_icons/Code_along_icon_md.png">

Getting Stories

---

<img id ='icon' src="assets/ICL_icons/Exercise_icon_md.png">
##Teddit API News

---

## Homework

*	Secret Number
* Continue with ex_teddit_api_news

---

<div id="resources">
## Resources: Collections, Loops & APIs

###Cheat Sheet

####Array of Hashes

```ruby
	super_heros =[{ hero: 'Batman', secret_identity: 'Bruce Wayne'},
	{hero: 'Superman', secret_identity: 'Clark Kent'},
	{hero: 'Spiderman', secret_identity: 'Peter Parker'}]
```


####.each & .map

```ruby
	super_heros.map do |super_hero|
		puts "#{super_hero[:hero]} is #{super_hero[:secret_identity]}"
	end
```

```ruby
	super_heros.each do |super_hero|
		puts "#{super_hero[:hero]} is #{super_hero[:secret_identity]}"
	end
```

*	.each returns the original array.
*	Map returns a new array with the results you added.

---

###Tips, Tricks & Motivation


*	[Writing A REST Client in Ruby](http://www.alphadevx.com/a/88-Writing-a-REST-Client-in-Ruby)

*	[Use RestClient for HTTP requests in Ruby](https://coderwall.com/p/bmgapg)

*	[Understand Rest Client (Advanced)](http://www.ibm.com/developerworks/library/os-understand-rest-ruby/)

*	[JSON What It Is, How It Works and How To Use It](http://www.copterlabs.com/blog/json-what-it-is-how-it-works-how-to-use-it/)
	*	The code in this article is JavaScript. Read the article to get a better understanding of what is JSON don't worry about the code.

__Map versus Each__

*	[Difference Between Map And Each](http://stackoverflow.com/questions/9586989/difference-between-map-and-each)

*	[Video about Difference Between Map and Each](http://www.youtube.com/watch?v=jJHzwgPl5lA)

---

###Still Feel Lost?
####Catch Up With These Resources

-	Fizz Buzz Answer [Video](https://vimeo.com/67752034)
-	Rest Client [Video](http://vimeo.com/67132957) by Steven Nuñez on behalf of General Assembly
-
	-	password=> testBEWD
