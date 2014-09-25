require 'pry'

def greeting
	puts "Hi there!"
end

def user_input
	user = {}

	puts "What's your name?"
	user[:user_name] = gets.chomp.capitalize

	puts "How old are you?"
	user[:user_age] = gets.chomp.to_i

	puts "Are you a girl or boy?"
	user[:user_gender] = gets.chomp.downcase

	user
end

def nickname(user)
	user[:nickname] = user[:user_name].chars.first

	puts "#{user[:user_name]}, do you mind if I call you #{user[:nickname]}?"
	answer = gets.chomp.downcase

	puts "Great!" unless answer == "yes"

	puts "Too bad. I'm going to anyways!" if answer == "yes"

	user[:user_name] = user[:nickname]

	puts "Nice to meet you, #{user[:user_name]}!"
end

def age_based_message(user)
	puts "I'm 33 years old too!" if user[:user_age] == 33

	case
	when user[:user_age] < 75
		puts "Did you know that you'll be 75 in #{75 - user[:user_age]} year(s)."
	when user[:user_age] > 75
		puts "Did you know that you turned 75 #{user[:user_age] - 75} year(s) ago."
	else
		puts "You're 75!"
	end

	puts "You sure are a young #{user[:user_gender]}." if user[:user_age] <= 20 
end

def great_great_grandparent(user)
	if (user[:user_age] >= 100) && (user[:user_gender] == "girl")
	puts "Wow, you're old! You must be a great-great grandmother." 
	elsif (user[:user_age] >= 100) && (user[:user_gender] == "boy")
		puts "Wow, you're old! You must be a great-great grandfather."
	else
		puts "So, you're not old enough to be a great-great grandparent."
	end
end

def get_user_city_state(user)
	puts "What city do you live in?"
	user[:city] = gets.chomp.capitalize

	puts "What state is #{user[:city]} located? (use abbreviation)"
	user[:state] = gets.chomp.upcase

	puts "That's right! #{user[:city]} is in the state of #{user[:state]}."
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

def grocery_store
	grocery_list = ["milk", "bread", "chips", "bacon", "wine", "cereal"]

	puts "Let's go to the grocery store. Here's the list of things we need:"

	# grocery_list.each { |list| puts list, " " }
	puts grocery_list.join(", ")

	random_item = grocery_list.sample
	puts "Did you grab the #{random_item}?"
	grab_random_item = gets.chomp.downcase

	if grab_random_item == "yes"
		grocery_list.delete(random_item)
	else
		puts "Can you please go get it? Thank you :)"
	end

	puts "Here's what's left:"
	puts grocery_list.join(", ")

	puts "Oh yeah, don't forget the eggs!"
	grocery_list << "eggs"	
end

def goodbye
	puts "You're fun! Thanks for talking with me today!"	
end




greeting
the_user = user_input
nickname(the_user)
age_based_message(the_user)
great_great_grandparent(the_user)
get_user_city_state(the_user)
puts the_user[:user_age] >= 16 ? "Yay! You are old enough to drive!" : "You're too young to drive, sorry!"
go_to_park(the_user[:user_age])
puts "Hey #{the_user[:user_name]}, where are you going?"
puts "Yo 'Dude', what's up? Come back here!"
grocery_store
goodbye

