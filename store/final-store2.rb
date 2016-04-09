@inventory = {}
@shopping_list = ""
@total_price = 0.0

def add_products(product, quantity, price)
  @inventory[product] = {
    "quantity" => quantity,
    "price" => price
  }
end

def create_products
  add_products("eggs", 20, 0.20)
  add_products("milk", 10, 1)
  add_products("bread", 15, 1.2)
  add_products("honey", 7, 2)
  add_products("juice", 5, 1.5)
end

create_products

def show_inventory
  puts "The invenory contains the following:
  #{@inventory}"
end

def check_inventory(product)
  if @inventory.has_key?(product)
    puts "There are #{@inventory[product]["quantity"]} #{product} available"
  elsif
    @inventory[product]["quantity"] = 0
    puts "We are running out of #{product}!"
  else
    puts "Sorry, #{product} doesn`t exist in inventory!"
  end
end

def add_to_shopping_list(product, quantity)
  @shopping_list << "#{product}: #{quantity} items\n"
  @inventory[product]["quantity"] -= quantity
end

def add_to_price(product, quantity)
  price_per_item = @inventory[product]["price"]
  @total_price += (quantity*price_per_item)
end

def show_shopping_list
  puts "Your shopping list is:
#{@shopping_list}
THE TOTAL PRICE IS #{@total_price}"
end



puts "Welcome to our store! Would you like to see our products?[y/n]"
answer = gets.chomp.downcase
if answer == "y"
  show_inventory
end

puts "Would you like to check if a product is available?[y/n]"
answer = gets.chomp.downcase
if answer == "y"
  puts "Type the name of the desired product.[e.g. milk]"
  product = gets.chomp.downcase
  check_inventory(product)
end

puts "Would you like to add a product to the shopping list?[y/n]"
answer = gets.chomp.downcase
if answer == "y"
  puts "What product would you like to add? Type the name(e.g. eggs)"
  product = gets.chomp
  puts "What is the desired quantity? Type a number"
  quantity = gets.chomp.to_i

  add_to_shopping_list(product, quantity)
  add_to_price(product, quantity)
  puts "#{quantity} #{product} added to the shopping list"
end


shopping = true
while shopping
  puts "Would you like to continue shopping?[y/n]"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "What product would you like to add? Type the name(e.g. eggs)"
    product = gets.chomp
    puts "What is the desired quantity? Type a number"
    quantity = gets.chomp.to_i

    add_to_shopping_list(product, quantity)
    add_to_price(product, quantity)
    puts "#{quantity} #{product} added to the shopping list"
  else
    shopping = false
  end
end

puts "Would you like to see your shopping list?[y/n]"
answer = gets.chomp.downcase
if answer == "y"
  show_shopping_list
end
