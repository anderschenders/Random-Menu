# function for creating lists of user input
def array_generator(displayed_items, descriptor)
  t = 0
  list = []
  until t == displayed_items do
    puts "Please enter a type of #{descriptor}: "
    entry =  gets.chomp
    list[t] = entry
    t += 1
  end

  return list
end

# prompt for user input to populate 3 arrays
flavour = []
fruit = []
dessert = []

puts "How many menu items would you like to choose from today?: "
displayed_items = gets.chomp

# ensure user input is a numeric value
until displayed_items.to_i.to_s == displayed_items do
  puts "Please enter a number: "
  displayed_items = gets.chomp
end

# convert displayed_items to integer
displayed_items = displayed_items.to_i

flavour = array_generator(displayed_items, "flavour")
fruit = array_generator(displayed_items, "fruit")
dessert = array_generator(displayed_items, "dessert")

puts  "Great. Here's your menu for today: "

# randomly generate menu items
# output results
num = 0   # keep track of number of times in loop
menu_items = [] # store generated menu items

until num == displayed_items do
    flavour_pick = flavour.sample(1).join(',')
    # remove selected item from array
    flavour.delete_if {|x| x == flavour_pick}

    fruit_pick = fruit.sample(1).join(',')
    # remove selected item from array
    fruit.delete_if {|x| x == fruit_pick}

    dessert_pick = dessert.sample(1).join(',')
    # remove selected item from array
    dessert.delete_if {|x| x == dessert_pick}

    menu_items[num] = "#{flavour_pick} #{fruit_pick} #{dessert_pick}"

    puts "#{num + 1}: #{menu_items[num]}"

    # see if menu_items includes pie (my favourite dessert)
    if menu_items[num].include?("pie")
      puts "Yay pie!"
    else
    end

    num += 1
end
