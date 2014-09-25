require 'pry'

def greeting
	puts "Hi there!"
end

def get_user_input
	user = {}

	puts "What's your name?"
	user[:name] = gets.chomp.capitalize

	puts "How old are you?"
	user[:age] = gets.chomp.to_i

	puts "Are you a girl or boy?"
	user[:gender] = gets.chomp.downcase

	user
end

def nickname_message(user)
	user[:nickname] = user[:name].chars.first

	puts "#{user[:name]}, do you mind if I call you #{user[:nickname]}?"
	answer = gets.chomp.downcase

	puts "Great!" unless answer == "yes"

	puts "Too bad. I'm going to anyways!" if answer == "yes"

	user[:name] = user[:nickname]

	puts "Nice to meet you, #{user[:name]}!"
end

def age_based_message(user)
	puts "I'm 33 years old too!" if user[:age] == 33

	case
	when user[:age] < 75
		puts "Did you know that you'll be 75 in #{75 - user[:age]} year(s)."
	when user[:age] > 75
		puts "Did you know that you turned 75 #{user[:age] - 75} year(s) ago."
	else
		puts "You're 75!"
	end

	puts "You sure are a young #{user[:gender]}." if user[:age] <= 20 
end

def great_great_grandparent(user)
	if (user[:age] >= 100) && (user[:gender] == "girl")
	puts "Wow, you're old! You must be a great-great grandmother." 
	elsif (user[:age] >= 100) && (user[:gender] == "boy")
		puts "Wow, you're old! You must be a great-great grandfather."
	else
		puts "So, you're not old enough to be a great-great grandparent."
	end
end

def user_city_state(user)
	puts "What city do you live in?"
	user[:city] = gets.chomp.capitalize

	puts "What state is #{user[:city]} located? (use abbreviation)"
	user[:state] = gets.chomp.upcase

	puts "That's right! #{user[:city]} is in the state of #{user[:state]}."
end

def can_user_drive(user)
	puts user[:age] >= 16 ? "Yay! You are old enough to drive!" : "You're too young to drive, sorry!"
end

def go_to_park(user)
	if user[:age] >= 16
		puts "Can you drive me to the park?"
		take_to_store = gets.chomp.downcase
		puts take_to_store == "yes" ? "Great! Let me grab my frisbee." : "You suck!!"
	else
		puts "I guess you can't take me to the park. I'll find someone else."
	end
end

def come_back_here_message(user)
	puts "Hey #{user[:name]}, where are you going?"
	puts "Yo 'Dude', what's up? Come back here!"
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
the_user = get_user_input
nickname_message(the_user)
age_based_message(the_user)
great_great_grandparent(the_user)
user_city_state(the_user)
can_user_drive(the_user)
go_to_park(the_user)
come_back_here_message(the_user)
grocery_store
goodbye






read("grocery_list.txt")
grocery_list.chomp
# grocery_list.gsub("\n", "") -----> this is what .chomp does
grocery_list = grocery_list.split(", ")
grocery_list.each { |item| item.downcase! } #this line and next line do the same thing
grocery_list.map! { |item| item.downcase }




# grocery_list = IO.read("grocery_list.txt").chomp.split(", ")
# grocery_list.map! { |item| item.downcase }

# grocery_list.shift
# IO.write("new_grocery_list.txt" , grocery_list.join(", "))
