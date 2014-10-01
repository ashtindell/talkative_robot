class GroceryList
  def initialize(args)
    @file   = args[:file]
    @items  = args[:items] || read_list
  end

  def go_to_grocery_store
    puts "Let's go to the grocery store. Here's the list of things we need:"
    print_groceries
    random_item
    grab_random_item
    puts add_grocery_item
    puts "Here's what's left:"
    print_groceries
    write_grocery_list_csv
    write_grocery_list_txt
  end

  def read_list
    @items = IO.read(@file).chomp.split(", ")
    @items.map! { |item| item.downcase }
  end

  def print_groceries
    @items.each_index { |i| puts "Item #{i + 1} -- #{@items[i]}" }
  end

  # new
  def random_item
    @random_item ||= @items.sample
  end

  def grab_random_item
      puts "Did you grab the #{random_item}? (yes or no)"
      grab_random_item = gets.chomp.downcase
      if grab_random_item == "yes"
        @items.delete(random_item)
        puts "Thanks!"
      else
        puts "Can you please go get it? Thank you:)"
      end
  end

  def add_grocery_item
    @items << "eggs"
    "Oh yeah, don't forget the eggs!"
  end

  def write_grocery_list_txt
    IO.write("new_grocery_list.txt", @items.join(", ")) 
  end

  def write_grocery_list_csv
    CSV.open("new_grocery_list.csv", "w") do |csv|
      csv << ["Item Number", "Item Name"]
      @items.each_index do |i| 
        csv << ["#{i + 1}", @items[i]]
      end
    end
  end
end