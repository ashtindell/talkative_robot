require 'pry'

def user_input
	user = {}

	puts "What's your name?"
	user[:user_name] = gets.chomp.capitalize

	puts "How old are you?"
	user[:user_age] = gets.chomp.to_i

	puts "What city do you live in?"
	user[:city] = gets.chomp.capitalize

	puts "What's the abbreviation for the state #{user[:city]} is located?"
	user[:state] = gets.chomp.upcase

	puts "Are you a girl or boy?"
	user[:user_gender] = gets.chomp.downcase

	user
end

def greeting
	puts "Hi there!"
end

def goodbye
	puts "You're fun! Thanks for talking with me today!"	
end

def age_based_message(age)
	case
	when age < 75
		puts "Did you know that you'll be 75 in #{75 - age} year(s)."
	when age > 75
		puts "Did you know that you turned 75 #{age - 75} year(s) ago."
	else
		puts "You're 75!"
	end
end

def go_to_park(age)
	if age >= 16
		puts "Can you drive me to the park?"
		take_to_store = gets.chomp.downcase
		puts take_to_store == "yes" ? "Great! Let me grab my frisbee." : "You suck!!"
	else
		puts "I guess you can't take me to the park. I'll find someone else."
	end
end

def great_great_grandparent(age, gender)
	if (age >= 100) && (gender == "girl")
	puts "Wow, you're old! You must be a great-great grandmother." 
	elsif (age >= 100) && (gender == "boy")
		puts "Wow, you're old! You must be a great-great grandfather."
	else
		puts "So, you're not old enough to be a great-great grandparent."
	end
end

def nickname(user)
	user[:nickname] = user[:user_name].chars.first

	puts "#{user[:user_name]}, do you mind if I call you #{user[:nickname]}?"
	answer = gets.chomp.downcase

	puts "Great!" unless answer == "yes"

	puts "Too bad. I'm going to anyways!" if answer == "yes"

	user[:user_name] = user[:nickname]

	puts "#{user[:user_name]}!"
end

def grocery_store
	grocery_list = ["milk", "bread", "chips", "bacon", "wine", "cereal"]

	puts "Let's go to the grocery store. Here's the list of things we need:"

	grocery_list.each { |list| puts list, " " }

	random_item = grocery_list.sample
	puts "Did you grab the #{random_item}?"
	grab_random_item = gets.chomp.downcase

	if grab_random_item == "yes"
		grocery_list.delete(random_item)
	else
		puts "Can you please go get it? Thank you :)"
	end

	puts "Oh yeah, don't forget the eggs!"
	grocery_list << "eggs"	
end




greeting

user = user_input

nickname(user)

puts "I'm 33 years old too!" if user[:user_age] == 33

puts "You sure are a young #{user[:user_gender]}." if user[:user_age] <= 20 

puts "#{user[:user_name]} is a #{user[:user_gender]} who is #{user[:user_age]} years old."

age_based_message(user[:user_age])

great_great_grandparent(user[:user_age], user[:user_gender])

puts user[:user_age] >= 16 ? "Yay! You are old enough to drive!" : "You're too young to drive, sorry!"

go_to_park(user[:user_age])

puts "Hey #{user[:user_name]}, where are you going?"

puts "Yo 'Dude', what's up? Come back here!"

puts "Did you know #{user[:city]} is in the state of #{user[:state]}."

grocery_store

goodbye

