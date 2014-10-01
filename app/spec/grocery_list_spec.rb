require 'spec_helper'
require './lib/grocery_list.rb'

describe "GroceryList" do
  let(:grocery_list) { GroceryList.new( { items: ["milk", "bread", "cheese"] } ) }

  describe "add_grocery_item" do
    context "@items << 'eggs'" do
      it "returns added grocery item to list" do
        expected_message = "Oh yeah, don't forget the eggs!"
        expect(grocery_list.add_grocery_item).to eq(expected_message)
      end
    end
  end
end


  # describe "pick_random_grocery_item" do
  #   context "@random_item = @items.sample" do
  #     it "returns random grocery item" do
  #       expect(grocery_list.pick_random_grocery_item).to eq(???)
  #     end
  #   end
  # end

# describe "GroceryList" do
  #   let(:grocery_list) { GroceryList.new(["milk", "eggs", "bread"]) }
  # describe "random_item" do
  #   context "first time its run" do
  #     it "finds a random sample" do
  #       random_item = grocery_list.random_item
  #       expect(grocery_list.include?(@random_item)).to be_true
  #     end
  #   end

  # context "second time its run" do
  #   it "grabs prior assignment" do
  #     first_random_item = grocery_list.random_item
  #     second_random_item = grocery_list.random_item
  #     expect(first_random_item).to eq(second_random_item)
  #   end
  # end