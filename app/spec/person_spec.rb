require 'spec_helper'
require './lib/person'

describe "Person" do
  let(:person) { Person.new( { name: "Ashley", age: 33, gender: "girl",
    nickname: "A", city: "Atlanta", state: "GA" } ) }

  describe "age_based_message" do
    context "@age < 75" do
      it "returns proper message" do
        expected_message = "Did you know that you'll be 75 in 42 year(s)."
        expect(person.age_based_message).to eq(expected_message)
      end
    end 

    context "@age > 75" do
      it "returns proper message" do
        person = Person.new( { name: "Ashley", age: 80, gender: "girl" } )
        expected_message = "Did you know that you turned 75 5 year(s) ago."
        expect(person.age_based_message).to eq(expected_message)
      end
    end 

    context "@age == 75" do
      it "returns proper message" do
        person = Person.new( { name: "Ashley", age: 75,
          gender: "boy" } )
        expected_message = "You're 75!"
        expect(person.age_based_message).to eq(expected_message)
      end
    end 
  end

  describe "great_great_grandparent" do
    context "old? && girl?" do
      it "returns is great-great grandmother" do
        person = Person.new( { age: 100, gender: "girl" } )
        expected_message = "Wow, you're old! You must be a great-great grandmother."
        expect(person.great_great_grandparent).to eq(expected_message)
      end
    end

    context "old? && boy?" do
      it "returns is great-great grandfather" do
        person = Person.new( { age: 100, gender: "boy" } )
        expected_message = "Wow, you're old! You must be a great-great grandfather."
        expect(person.great_great_grandparent).to eq(expected_message)
      end
    end

    context "....." do
      it "returns isn't great-great grandparent" do
        expected_message = "So, you're not old enough to be a great-great grandparent."
        expect(person.great_great_grandparent).to eq(expected_message)
      end
    end
  end

  describe "can_drive?" do
    it "returns if user can drive" do
      expect(person.can_drive?).to be_truthy
    end

    it "returns if user cannot drive" do
      person = Person.new( { age: 15 } )
      expect(person.can_drive?).to be_falsey
    end
  end

  describe "can_drive_message" do
    context "if can_drive?" do
    it "returns proper message" do
      expected_message = "Yay! You are old enough to drive!"
      expect(person.can_drive_message).to eq(expected_message)
      end
    end

    context "unless_can_drive?" do
    it "returns proper message" do
      person = Person.new( { age: 15 } )
      expected_message = "You're too young to drive, sorry!"
      expect(person.can_drive_message).to eq(expected_message)
      end
    end
  end
end





