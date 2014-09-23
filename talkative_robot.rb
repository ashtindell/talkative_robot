require 'pry'

puts "What is your name?"

user_name = gets.chomp

puts "How old are you?"
user_age = gets.chomp.to_i

puts "Hi #{user_name}, who is #{user_age} years old!"

first_initial = user_name.chars.first
puts "Do you mind if I call you #{first_initial}?"

age_seventy_five_years = 75 - user_age

puts "You will be 75 years old in #{age_seventy_five_years} years."

user_name.upcase!

puts "Hey #{user_name}, where are you going?"

puts "Yo 'Dude', what's up?"

puts "What city do you live in?"
city = gets.chomp

puts "What state is #{city} in?"
state = gets.chomp

puts "#{city} is in the state of #{state}."
