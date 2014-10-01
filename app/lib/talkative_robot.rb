require 'pry'
require 'csv'
require './person'
require './user'
require './author'
require './grocery_list'

the_author = Author.info
@author = Author.new(the_author)
puts @author.greeting
the_user = User.get_input
@user = User.new(the_user)
@user.nickname_message
puts @user.age_based_message
puts @user.great_great_grandparent
puts @user.can_drive_message
@user.go_to_park
@user.city_state
puts @user.come_back_here_message

# items = ["milk", "eggs"]
# @grocery_list = GroceryList.new({ items: items }) # Will use milk and eggs
@grocery_list = GroceryList.new({ file: "grocery_list.txt" }) # will use what's in the file
@grocery_list.go_to_grocery_store
@author.goodbye
