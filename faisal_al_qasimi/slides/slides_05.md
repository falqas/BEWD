# Classes & Objects
![huh](http://i.imgur.com/5SyN8H9.gif)

---

But first...
## Our last foray into APIs

---

## Quick Practice - API 
![code\_along](https://www.dropbox.com/s/saiiostayfmmdzf/code_along.png?dl=1)

---

We've covered a few different data types:

`String`, `Integer`, `Symbol`, `Boolean`

And a few different data structures:

`Array`, `Hash`

What are some pros and cons of using hashes?

And lastly, the concept of:

- Methods
- Looping

What else could there be?

---

### A lot.

---

## Object-oriented Programming

---

##Classes & Objects
###Classes to the rescue

* What is a class?
* What is an object?
* Why/when to use them?

---

## What is it?

Object-oriented programming is a way of writing your code that defines unique "packages" of code and attributes into one object.

While it may seem like you can get away without writing Ruby in an object-oriented manner, you can't. Almost everything in Ruby is an object, whether you realize it or not.

---

## Classes and Objects

A `Class` can be thought of as the "mold" of a manufactured item. The final product of what the mold creates can be thought of as the `Object`.

For example, to create a lego, you must have the mold, and plastic. Plastic can be thought of as the `parameter`s, the mold can be thought of as the `Class`, and the finished lego can be thought of as the `Object`.

---

## Classes and Objects - visualized

```ruby
class Lego
end
```

```ruby
red_brick = Lego.new
```

We always references classes by their name which has an uppercase letter.

To create a new "instance" of a class (an object), we call `.new`. This is called instantiation of an object.

---

## Classes

At their core, classes can only contain one of two things inside of them:

1. Methods
2. Instance variables

---

## Methods in classes

```ruby
class Person
  def greet
    "Hi there"
  end
end
```

```
sandip = Person.new
puts sandip.greet
```

---

## Instance-wha?

Instance variables.

```ruby
@name = 'Sandip'
```

They're prefaced with an `@`, and are available to _any_ method inside of the same class. No longer do you have to worry about method scope.

---

## Instance Variables in Classes

```ruby
class Person
  def name=(submitted_name)
    @name = submitted_name
  end

  def name
    @name
  end
end
```

In this example we have two types of methods. One, known as a "setter" (the one with the `=`), and the other, known as a "getter".

```ruby
human = Person.new
human.name = 'Sandip'
human
#=> "Sandip"
```

---

## You've totally seen this before!

Think about when you call methods after the variable you've defined with a `.`

For example:

```ruby
name = "Sandip"
"Sandip".size
```

Ruby is actually adding this in between step:

```ruby
name = "Sandip"
name = String.new(name)
name.size
```

---

## Ruby, what in the actual hell are you doing?

```ruby
1.class
#=> Fixnum
```

```ruby
class Fixnum
  def +(another_number)
    42
  end
end
```

```ruby
1 + 1
#=> 42

12 + 4
#=> 42
```

...queue up mind blown gif

---

![mindblown](http://i.imgur.com/sg017lt.gif)

---

## The constructor

The constructor is a special method in every class that is automatically called before anything else.

```ruby
class Post
  def initialize
    @title = "Default title"
  end

  def title
    @title
  end
end
```

```ruby
first_post = Post.new
first_post.title
#=> "Default title"
```

---


<img id ='icon' src="../../assets/ICL_icons/Code_along_icon_md.png">
##Creating Objects

---

##Creating Objects
###Recap

* Adding variables to a class

```ruby
# Hashes
story = {}
story[:title] = "Sand angry with flip-flops"
story[:title] #=> Returns your value


# With an object
class Story
  attr_accessor :title
end


story = Story.new
story.title = "Sand angry with flip-flops"
story.title #=> Returns your value
```

---

##Creating Objects
###Recap

* Adding methods to our class

```ruby
class Story
  attr_accessor :title, :category, :upvotes
  def upvote!
    @upvotes += 1
  end
end

story = Story.new
story.title = "Fruit Flies find fleas facetious"
story.category = "Turf War"
story.upvotes = 1

story.upvote!
story.upvotes #=> 2
```

---

<img id ='icon' src="../../assets/ICL_icons/Code_along_icon_md.png">
##Apartment

---

##Apartment
###Recap

* The initialize method is invoked when Apartment.new is called
* to_s method called automatically on objects interpolated in a string (e.g. with puts)
* to_s can be overridden:

```ruby
class My_Class
  def to_s
    "The puts method was called."
  end
end

>> my_object = My_Class.new
>> puts my_object
The puts method was called.
=> nil
```

---


##Apartment
###Recap

* Classes allow us to keep code DRY.
* In object oriented programs variables have scope (key scopes are local vs @instance).
  * attr_accessor allows a variable to be accessed outside of a method
* We can create class methods by using self.method_name.
  * Class methods (e.g. Apartment.new) can be called on a class (which is an object too!)

---


##Classes & Objects
###Classes in separate .rb files


---

##Classes & Objects
###Too many classes in one .rb file.

```ruby
# blt.rb
class BLT
  #…
end

class Bacon
  #…
end

class Lettuce
  #…
end

class Tomato
  #…
end
```

---


##Classes & Objects
###Everyone Gets a File!

```ruby
# blt.rb
require_relative 'bacon'
require_relative 'lettuce'
require_relative 'tomato'

class BLT
  #…
end
```

---

##Classes & Objects
###Creating a link between classes in separate .rb file

* require
* require_relative (we've seen this when working with APIs)
* $LOAD_PATH.unshift(File.dirname(__FILE__)) (use to load files in irb)

---


<img id ='icon' src="../../assets/ICL_icons/Exercise_icon_md.png">
##Lab Time

1.  Apartment Objects
2.  Secret Number Objects

---

## Homework

Start to think of a midterm project.

__Requirements__:

1. It must be object oriented
2. It must communicate with an API

---

<div id="resources">
## RESOURCES: Classes & Objects

###Cheat Sheet

####Classes & Objects

__Create A Class__

```ruby
  class class_name
      #variables and method for this class.
  end
```

---

__Creating Objects__

```ruby
  class GA_course
    def initialize (course_name)
      @course_name = course_name
    end

    def announce_course
      puts "GA has a course on #{@course_name}"
    end
  end

  my_course = GA_course.new("BEWD")
  other_course = GA_course.new("UXD")

  my_course.announce_course
  other_course.announce_course
```
>GA has a course on BEWD

>GA has a course on UXD

---

__Variable Scope__


| Scope |Example| Explanation|
| ------------- |:-------------|:-------------------|
| Local      | @name | Available in the same method|
| Instance   | name | Unique value for each instance of a class available from any method in that class.|
| Class   | @@name  | Same shared value for all instances of a class, available from any method of that class.|
| Global   | $name  | Same shared value for all code running within a single Ruby program.|

---

###Still Feel Lost?
####Catch Up With These Resources

- What is Object Oriented Programming [video](http://www.youtube.com/watch?feature=endscreen&v=SS-9y0H3Si8&NR=1)
- What is Object Oriented Programming [Book Chapter](http://ruby.bastardsbook.com/chapters/oops/)
- Introduction to Objects [Ruby Monk](http://rubymonk.com/learning/books/1-ruby-primer/chapters/6-objects/lessons/35-introduction-to-objects)
- Building your Own class [Ruby Monk](http://rubymonk.com/learning/books/1-ruby-primer/chapters/7-classes/lessons/40-building-your-own-class)
