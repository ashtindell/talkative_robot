require 'spec_helper'
require './lib/person'
require './lib/author'

describe "Author" do
  let(:author) { Author.new( { name: "Ashley", age: 33, gender: "girl",
    nickname: "A", city: "Atlanta", state: "GA"} ) }

  describe "greeting" do
    it "returns author greeting" do
      expected_message = "Hi there! My name is Ashley, but I go by A."
      expect(author.greeting).to eq(expected_message)
    end
  end
end
