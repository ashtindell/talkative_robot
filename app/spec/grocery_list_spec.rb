require 'spec_helper'
require './lib/grocery_list.rb'

describe "GroceryList" do
  let(:grocery_list) { GroceryList.new( { file: "./lib/grocery_list.txt" } ) }

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