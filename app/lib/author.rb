class Author < Person
  def initialize(args)
    super
  end

  def self.info
    author = { name: "Ashley", age: 33, gender: "girl", nickname: "A", 
               city: "Atlanta", state: "GA" }
  end

  def greeting
    "Hi there! My name is #{@name}, but I go by #{@nickname}."
  end

  def goodbye
    puts "You're fun! Thanks for talking with me today!"  
  end
end