class Person
  def initialize(args)
    @name     = args[:name]
    @age      = args[:age]
    @gender   = args[:gender]
    @nickname = args[:nickname]
    @city     = args[:city]
    @state    = args[:state]
  end

  def self.get_input
    user = {}
    puts "What's your name?"
    user[:name] = gets.chomp.capitalize

    puts "How old are you?"
    user[:age] = gets.chomp.to_i

    puts "Are you a girl or boy?"
    user[:gender] = gets.chomp.downcase

    user
  end

  def nickname_message
    @nickname = @name.chars.first
    puts "#{@name}, do you mind if I call you #{@nickname}?"
    answer = gets.chomp.downcase

    @answer = answer
    def yes?
      @answer == "yes"
    end

    "Great!" unless yes?
    "Too bad. I'm going to anyways!" if yes?

    # @name = @nickname
    "Nice to meet you, #{@name}!"
  end

  def age_based_message
    "I'm 33 years old too!" if @age == 33

    case
    when @age < 75
      "Did you know that you'll be 75 in #{75 - @age} year(s)."
    when @age > 75
      "Did you know that you turned 75 #{@age - 75} year(s) ago."
    else
      "You're 75!"
    end
  end

  def old?
    @age >= 100
  end

  def girl?
    @gender == "girl"
  end

  def boy?
    @gender == "boy"
  end

  def great_great_grandparent
    if old? && girl?
      "Wow, you're old! You must be a great-great grandmother."
    elsif old? && boy?
      "Wow, you're old! You must be a great-great grandfather."
    else
      "So, you're not old enough to be a great-great grandparent."
    end
  end

  def city_state
    puts "What city do you live in?"
    @city = gets.chomp.capitalize

    puts "What state is #{@city} located? (use abbreviation)"
    @state = gets.chomp.upcase

    puts "That's right! #{@city} is in the state of #{@state}."
  end

  def can_drive?
    @age >= 16
  end

  def can_drive_message
    return "Yay! You are old enough to drive!" if can_drive?
    return "You're too young to drive, sorry!" unless can_drive?
  end

  def go_to_park
    if can_drive?
      puts "Can you drive me to the park?"
      drive_to_park = gets.chomp.downcase
      puts drive_to_park == "yes" ? "Great! Let me grab my frisbee." : "You suck!"
    else
      puts "I guess you can't drive me to the park. I'll find someone else."
    end
  end

  def come_back_here_message
    "Hey #{@name}, where are you going?\nYo 'Dude', what's up? Come back here!"
  end
end