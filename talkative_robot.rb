require 'pry'
require 'csv'

class Person
	def initialize(args)
		@name 	  = args[:name]
		@age 	  	= args[:age]
		@gender   = args[:gender]
		@nickname = args[:nickname]
		@city     = args[:city]
		@state    = args[:state]
	end
end

class Author < Person
	def initialize(args)
		super
	end

	def self.info
		author = { name: "Ashley", age: 33, gender: "girl", nickname: "Ash", 
				  		 city: "Atlanta", state: "GA" }
	end

	def greeting
		puts "Hi there! My name is #{@name}, but I go by #{@nickname}."
	end
end

class User < Person
	def initialize(args)
		super
	end

	def self.get_input
		user = {}
		puts "What's your name?"
		user[:name] = gets.chomp.capitalize

		puts "How old are you?"
		user[:age] = gets.chomp.to_i

		puts "Are you a girl or boy?"
		user[:gender] = gets.chomp.downcase

		user
	end

	def nickname_message
		@nickname = @name.chars.first

		puts "#{@name}, do you mind if I call you #{@nickname}?"
		answer = gets.chomp.downcase

		@answer = answer
		def yes?
			@answer == "yes"
		end

		puts "Great!" unless yes?
		puts "Too bad. I'm going to anyways!" if yes?

		@name = @nickname
		puts "Nice to meet you, #{@name}!"
	end

	def age_based_message
		puts "I'm 33 years old too!" if @age == 33

		case
		when @age < 75
			puts "Did you know that you'll be 75 in #{75 - @age} year(s)."
		when @age > 75
			puts "Did you know that you turned 75 #{@age - 75} year(s) ago."
		else
			puts "You're 75!"
		end

		puts "You sure are a young #{@gender}." if @age <= 20 
	end

	def great_great_grandparent
		def old?
			@age >= 100
		end

		def girl?
			@gender == "girl"
		end

		def boy?
			@gender == "boy"
		end

		if old? && girl?
			puts "Wow, you're old! You must be a great-great grandmother."
		elsif old? && boy?
			puts "Wow, you're old! You must be a great-great grandfather."
		else
			puts "So, you're not old enough to be a great-great grandparent."
		end
	end

	def city_state
		puts "What city do you live in?"
		@city = gets.chomp.capitalize

		puts "What state is #{@city} located? (use abbreviation)"
		@state = gets.chomp.upcase

		puts "That's right! #{@city} is in the state of #{@state}."
	end

	def can_drive?
		@age >= 16
	end

	def can_drive_message
		puts "Yay! You are old enough to drive!" if can_drive?
		puts "You're too young to drive, sorry!" unless can_drive?
	end

	def go_to_park
		if can_drive?
			puts "Can you drive me to the park?"
			drive_to_park = gets.chomp.downcase
			puts drive_to_park == "yes" ? "Great! Let me grab my frisbee." : "You suck!"
		else
			puts "I guess you can't drive me to the park. I'll find someone else."
		end
	end

	def come_back_here_message
		puts "Hey #{@name}, where are you going?"
		puts "Yo 'Dude', what's up? Come back here!"
	end
end

class GroceryList
	def initialize(items)
		@items = items
	end

	def go_to_grocery_store
		puts "Let's go to the grocery store. Here's the list of things we need:"
		read_list
		print_groceries
		pick_random_grocery_item
		add_grocery_item
		puts "Here's what's left:"
		print_groceries
		write_grocery_list_csv
		write_grocery_list_txt
	end

	def read_list
		@items = IO.read("grocery_list.txt").chomp.split(", ")
		@items.map! { |item| item.downcase }
	end

	def print_groceries
		@items.each_index { |i| puts "Item #{i + 1} -- #{@items[i]}" }
	end

	def pick_random_grocery_item
		random_item = @items.sample
		puts "Did you grab the #{random_item}? (yes or no)"
		grab_random_item = gets.chomp.downcase
		puts grab_random_item == "yes" ? @items.delete(random_item) : "Can you please go get it? Thank you :)"
	end

	def add_grocery_item
		puts "Oh yeah, don't forget the eggs!"
		@items << "eggs"
	end

	def write_grocery_list_txt
		IO.write("new_grocery_list.txt", @items.join(", "))	
	end

	def write_grocery_list_csv
		CSV.open("new_grocery_list.csv", "w") do |csv|
			csv << ["Item Number", "Item Name"]
			@items.each_index do |i| 
				csv << ["#{i + 1}", @items[i]]
			end
		end
	end
end

def goodbye
	puts "You're fun! Thanks for talking with me today!"	
end

the_author = Author.info
@author = Author.new(the_author)
@author.greeting
the_user = User.get_input
@user = User.new(the_user)
@user.nickname_message
@user.age_based_message
@user.great_great_grandparent
@user.can_drive_message
@user.go_to_park
@user.city_state
@user.come_back_here_message
@grocery_list = GroceryList.new(@items)
@grocery_list.go_to_grocery_store
goodbye
