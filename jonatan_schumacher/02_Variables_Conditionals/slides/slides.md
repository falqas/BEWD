![GeneralAssemb.ly](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png "GeneralAssemb.ly")

#BEWD - Variables and Conditional Logic

---


##Agenda

*	Quiz
*	Intro to Ruby & irb
* 	Variables
	* Numbers
	*	Strings
	*	Booleans
* 	Method Basics
* 	Conditional Logic
* 	Lab Time

---

##QUIZ
1.	How do I change directories using the command line?
2.	What is Git and GitHub?
3.	How do I add files to git?
4.	What is a GitHub Repository?
5.  What is the correct way to push changes to your GitHub repo?
  * `git pull origin master`
	* `git commit -m "push to GitHub"`
	* `git push origin master`

---

## Why Ruby?

Ruby is a concise, elegant and simple programming language.

```ruby
visit root_path
fill_out 'Compose new Tweet...', with: 'Tweet tweet chirp chirp'
click_link 'Tweet'
expect(page).to_not have_content 'Twitter is over capacity'
```

---

##Ruby
###A programming language

*	An open source programming language
*	Easy to read and natural to write
*	Created by Yukihiro Matsumoto (aka Matz) with the goal of building a language FOR developers
*	Regularly maintained and evolved (recently reached version 2.1.3)
* Written in C
* Dynamic scripting language
* Memory is managed for you
* Object oriented, and _fun_

<div style="text-align:center;">
  <img src="assets/ruby/ruby_img.png" />
</div>

---

##Rails
###A web application framework

*	Open source web application framework that is built in Ruby
*	Allows you to create web applications that query a database.
*	Created by DHH (David Heinemer Hansson) to simplify the task of building web applications, with the help of _conventions_
* By 2007, all Apple computers were shipping with Rails pre-installed
* Written in Ruby

![dhh](https://www.dropbox.com/s/q0goug7kx68vhtc/dhh.png?dl=1)

---

##Ruby & Rails
###Ruby first.

*	It will be easier to navigate a Rails project once we have a basic understanding of Ruby.
*	We will first teach you how to write simple Ruby scripts as stand-alone applications
*	Once we have become familiarized with Ruby, we will start building Rails applications (which are essentially groups of Ruby script files that work together)

---

##Computational Thinking
###What does it mean to program?

"Learning about “for” loops is not learning to program, any more than learning about pencils is learning to draw."

 –Bret Victor, Learnable Programming

---

![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Code_along_icon_md.png)
##Robot

---

##Robot Recap
###Its about changing how you think
*	Think in logical steps to solve a problem
*	Use Ruby keywords to help solve those problems
	*	Conditional Logic
	*	Iteration

---

## How to talk to Ruby

1. Using an interactive ruby terminal:

  ```bash
  gem install pry
  ```

  ```bash
  pry
  ```

2. Writing a script and executing it with the `ruby` command:

  ```bash
  echo "puts 'hello world'" > ~/Sites/first_program.rb
  ruby ~/Sites/first_program.rb
  ```

---

##Programming Fundamentals
* In order to start writing our own Ruby programs, we need to learn some of the basic fundamental tools
* Specifically, we need to learn:
	* Variables
	* Methods
	* Conditions
* We will first learn the basics on their own, and then try to apply our skills in a simple interactive Ruby script

---

##Saving Values
### Using Variables

* We can tell our program to remember values for us to use later on
* The action of saving a value to memory is called **assignment**
* The entity we use to store the value is called a **variable**
* The action of getting the value from a variable is called **accessing** the variable
* We will use all the above techniques to store values into variables, and generate new values using existing variables

---

##Variables
###Storing Values

	>> name = "Steven"
	 => "Steven"
	>> age = 2013 - 1983
	 => age # 30

---

##Data Types

* The types of different values we support include numbers, text, and other more complex ones we'll see in the future
* Ruby has its own names for these:

		1						#Fixnum
		1.99					#Float
		'Hi! String here!' 		#String
		"I'm a string tool"		#String

---

![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Code_along_icon_md.png)
##Variables

Let's learn how to assign and access simple integer and string variables

---

## Strings
__Words & sentences__

Can be denoted by either single or double quotes

```ruby
"Sandip"
#=> "Sandip"
"Sandip has two cats"
#=> "Sandip has two cats"

'Otto' + '&' + "Luna"
#=> "Otto&Luna"
```

---

## Numbers
No quotes surrounding the numbers

### Integers

```ruby
42
#=> 42

5 + 6
#=> 11
```

### Floats
```ruby
3.14
#=> 3.14

3.14 + 3.14
#=> 6.28
```

---

## Variables

Variables are simply a place to store data. The data can take on almost any form. All variables we store as lower case, and separate words are separated by underscores:

```ruby
first_name = 'Sandip'
last_name = 'Trivedi'
age = 2014 - 1983
```

```ruby
first_name
#=> 'Sandip'
last_name
#=> 'Trivedi'
age
#=> 31
```

---

## Concatenating Variables

There are two ways to join together variables:

1. By simply appending one thing after the other

  ```ruby
  full_name = first_name + ' ' + last_name
  ```

2. String interpolation

  ```ruby
  full_name_and_age = "#{full_name}, #{age} years old"
  ```

---

# puts

Puts is a method that Ruby gives you for free. It stands for "PUT" "String", out to the terminal:

```ruby
puts 'Hello there'
'Hello there'
#=> nil
```

Puts always returns `nil`

---

# gets

Gets is also a method that Ruby gives you for free. It stands for "GET" "String", requesting it from user input

```ruby
input = gets
hi there
#=> "hi there\n"
```

What's that `\n`? It's a newline (the user hitting enter)

```ruby
input = gets.strip
hi there
#=> "hi there"
```

---

##Math in Ruby
###Ruby Arithmetic Operators

![Ruby Arithmetic](assets/ruby/ruby_arithmetic.jpg)

---

##Saving Code
###Using Methods

* The same way we can store VALUES in memory by using variables…
* We can store CODE in memory by using methods.
* In other words, we can train the program to 'remember' a set of commands, and give that set of tasks a command name
* Then, we can call that command by name and the program will perform those tasks

---

## Methods
__They can take parameters__
<br><br>

```ruby
def feed_cats(cat1, cat2)
  "#{cat1} and #{cat2} have successfully been fed."
end

puts feed_cats('Otto', 'Luna')
#=> "Otto and Luna have successfully been fed."
```

---

![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Code_along_icon_md.png)
##Methods

Let's learn how to call simple methods, and how to declare our own methods.

---

##Methods
###Recap

* Methods let us train the program to 'remember' a set of code to perform later
* Making a new method is called **declaring** a method
* Declaring a method does NOT run the method immediately
* If the method takes in variables to use while it is doing its tasks, those are called **parameters**

---

![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Code_along_icon_md.png)
##Teddit - Strings

Teddit is a news aggregator we will build during this course.

---

##More Data Types
###Booleans

* Besides strings and integers, Ruby also has a Boolean data type
* A boolean is a simple value that is either ```true``` or ```false```
* When different data types are compared to each other, the result of that comparison is a boolean result (e.g. 5 < 7 => true)

---


##Boolean
###Logic Operators


![](assets/ruby/logic_operators.png)

---

### Booleans

Either true or false, booleans are what give us the ability to use logic when programming

```ruby
23 == 23
#=> true
```

```ruby
"A ruby string" == 'A ruby string'
#=> true
```

```ruby
'Otto' == 'Luna'
#=> false
```

```ruby
:symbol == 'symbol'
#=> false
```

---

![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Code_along_icon_md.png)
##Booleans

---

##Variables & Data Types
###Recap

Data Types

*	Number
*	Float (number with decimals)
*	String
*	Booleans

Variables

*	Store values
*	Can be passed to methods as parameters

---

##Conditional Logic
###Decision Time

It's either TRUE or FALSE (like booleans)

If you are greater than 18
you are an adult

	if age > 18
		puts "You are an adult"
	end

---

### Logic Operators

  Operator | Description | Example | Return value
  ---|---|---
  == | equal to | `'foo' == 'foo'` | true
  != | not equal to | `'foo' != 'bar'` | true
  > | greater than | `5 > 2` | true
  < | less than | `4 < 10` | true
  >= | greater than or equal to | `5 >= 5` | true
  <= | less than or equal to | `4 <= 3` | false

---

### Conditional Logic
__if__
<br><br>

```ruby
name = 'Otto'

if name == 'Otto'
  puts 'meow'
end

puts 'meow' if name == 'Otto'
```

---

### Conditional Logic
__unless__
<br><br>

```ruby
def cat?(name)
  true if name == 'Otto'
end

puts "You're not a cat" unless cat? 'Otto'
#=> nil
puts "You are a cat" if cat? 'Otto'
You are a cat
#=> nil
```

---

### Conditional Logic
__elsif, else__
<br><br>

```ruby
if age < 21
  puts "You are not allowed to drink"
elsif age > 21
  puts "Have a beer!"
else
  puts "Congratulations on turning 21"
end
```

---

### Multiple Conditions

__&&__
```ruby
number_one = 3
number_two = 4

if number_one.even? && number_two.even?
  puts 'The numbers are even'
end
```

---

### Multiple Conditions

__||__
```ruby
if current_user.admin? || current_user.student?
  show_page
end
```

---

##Conditional Logic
###Multiple Conditions


	guess = 7
	if guess > 5
		puts "Too high!"
	elseif guess < 5
		puts "Too Low!"
	else
		puts "You've guessed my hidden digit!"
	end

---

##Conditional Logic
###Multiple Conditions

![truth_table](assets/ruby/truth_table.png)

---

### Looping
__While__
<br><br>

```ruby
times_to_loop = 2
i = 0

while i < times_to_loop
  puts "This is iteration number #{i + 1}"
  i += 1
end
#=>This is iteration number 1
#=>This is iteration number 2
```

---

### Looping
__Until__
<br><br>

```ruby
input = ''

until input == 'unsubscribe'
  puts 'SPAM'
  input = gets.strip
end
```

---

![GeneralAssemb.ly](http://studio.generalassemb.ly/GA_Slide_Assets/Exercise_icon_md.png)
##Lab Time
* 	Conditional Teddit

---

## Homework
###Secret Number

Let's see a demo of Secret Number

*	HW 1 - Secret Number
	*	Secret number is a game we will incrementally build for homework during the Ruby portion of the course.
		Players must guess a secret number and your program will provide feedback.

---

