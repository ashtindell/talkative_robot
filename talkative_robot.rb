require 'pry'
require 'csv'

def greeting(author)
	puts "Hi there! My name is #{author[:name]}, but I go by #{author[:nickname]}."
end

def author_info
	author = { name: "Ashley", age: 33, gender: "girl", nickname: "Ash", 
			   city: "Atlanta", state: "GA" }

	author
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

def get_author(array_of_people)
	array_of_people.reject { |person| person[:name] != "Ashley" }.first
end

def select_by_name(list_of_users, first_name)
	list_of_users.select { |person| person[:name] == first_name }.first
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
	puts "Let's go to the grocery store. Here's the list of things we need:"
	grocery_list = read_grocery_list
	print_groceries(grocery_list)
	pick_random_grocery_item(grocery_list)
	add_grocery_item(grocery_list)
	puts "Here's what's left:"
	print_groceries(grocery_list)
	write_grocery_list_csv(grocery_list)
	update_grocery_list(grocery_list)
end

def read_grocery_list
	grocery_list = IO.read("grocery_list.txt").chomp.split(", ")
	grocery_list.map! { |item| item.downcase }
end

def print_groceries(groceries)
	item = groceries
	groceries.each_index { |i| puts "Item #{i + 1} -- #{groceries[i]}" }
end

def pick_random_grocery_item(groceries)
	random_item = groceries.sample
	puts "Did you grab the #{random_item}? (yes or no)"
	grab_random_item = gets.chomp.downcase
	puts grab_random_item == "yes" ? groceries.delete(random_item) : "Can you please go get it? Thank you :)"
end

def add_grocery_item(groceries)
	puts "Oh yeah, don't forget the eggs!"
	groceries << "eggs"
end

def update_grocery_list(groceries)
	groceries = IO.write("new_grocery_list.txt", groceries.join(", "))	
end

def write_grocery_list_csv(groceries)
	CSV.open("new_grocery_list.csv", "w") do |csv|
		csv << ["Item Number", "Item Name"]
		groceries.each_index do |i| 
			csv << ["#{i + 1}", groceries[i]]
		end
	end
end

# I still need to add this to groceries
# def read_grocery_list_csv(groceries)
# 	col_data = []
# 	CSV.foreach("new_grocery_list.csv") do |row|
# 		col_data << row[1]
# 	end
# 	col_data.shift
# 	puts col_data
# end

def goodbye
	puts "You're fun! Thanks for talking with me today!"	
end


the_author = author_info
greeting(the_author)
the_user = get_user_input
nickname_message(the_user)
age_based_message(the_user)
great_great_grandparent(the_user)
can_user_drive(the_user)
go_to_park(the_user)
user_city_state(the_user)
come_back_here_message(the_user)
grocery_store
goodbye
