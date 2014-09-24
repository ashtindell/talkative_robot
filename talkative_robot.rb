require 'pry'

puts "What is your name?"
user_name = gets.chomp.capitalize

first_initial = user_name.chars.first
puts "#{user_name}, do you mind if I call you #{first_initial}?"
answer = gets.chomp.downcase

puts "Great!" unless answer == "yes"

puts "Too bad. I'm going to anyways!" if answer == "yes"

puts "How old are you?"
user_age = gets.chomp.to_i

age_less_than_seventy_five = 75 - user_age
age_more_than_seventy_five = user_age - 75

case
when user_age < 75
	puts "You'll be 75 in #{age_less_than_seventy_five} year(s)"
when user_age > 75
	puts "You turned 75 #{age_more_than_seventy_five} year(s) ago."
when user_age == 75
	puts "You're 75!"
end

puts "Hi #{first_initial}, who is #{user_age} years old!"

puts "I'm 33 years old too!" if user_age == 33

puts user_age >= 16 ? "Yay! You are old enough to drive!" : "You're too young to drive, sorry!"

if user_age >= 16
	puts "I need to go to the store...can you take me? yes or no"
	take_to_store = gets.chomp.downcase
	puts take_to_store == "yes" ? "Great! Let me grab my wallet." : "You suck!!"
else
	user_name.upcase!
	puts "Hey #{user_name}, where are you going?"
	puts "Yo 'Dude', what's up? Come back here...I have more questions!"
end

puts "What city do you live in?"
city = gets.chomp.capitalize

puts "What's the abbreviation for the state #{city} is located?"
state = gets.chomp.upcase

puts "#{city} is in the state of #{state}."

puts "Are you a girl or boy?"
user_gender = gets.chomp.downcase

puts "You sure are a young #{user_gender}." if user_age <= 20 
puts "#{first_initial} is a #{user_gender} who is #{user_age} years old."
if (user_age >= 100) && (user_gender == "girl")
	puts "Wow, you're old! You must be a great-great grandmother. Thanks for talking with me today!" 
elsif (user_age >= 100) && (user_gender == "boy")
	puts "Wow, you're old! You must be a great-great grandfather. Thanks for talking with me today!"
else
	puts "Thanks for talking with me today!"
end




