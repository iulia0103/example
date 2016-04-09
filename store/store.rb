 puts "
Here is our list of products:
1) Eggs
2) Milk
3) Bread
4) Honey
5) Juice
 "

 @complete_list=""
 @total_price = 0.0

def add_to_list(product, price)
  @complete_list << "#{product} "
  puts "You chose #{product}.The price is #{price} euro per item"
end

def get_quantity(price)
  puts "How many items would you like to buy?"
  quantity = gets.chomp.to_i
  puts "The cost for #{quantity} items is #{quantity*price} euro."
  return quantity
end

def add_to_price(price, quantity)
 @total_price += (price*quantity)
end

puts "Please write the name of the desired product (e.g. Milk)"
product = gets.chomp.downcase

if (product != "eggs") && (product != "milk") && (product != "bread") && (product != "honey") && (product != "juice")
  puts "We are out of #{product}. Please type again."
  puts "Please write the name of the desired product (e.g. Milk)"
  product = gets.chomp.downcase

elsif product == "eggs"
   price = 0.20
   add_to_list(product, price)
   quantity = get_quantity(price)
   add_to_price(price, quantity)

elsif product == "milk"
    price = 1
    add_to_list(product, price)
    quantity = get_quantity(price)
    add_to_price(price, quantity)

elsif product == "bread"
      price = 1
      add_to_list(product, price)
      quantity = get_quantity(price)
      add_to_price(price, quantity)

elsif product == "honey"
        price = 2
        add_to_list(product, price)
        quantity = get_quantity(price)
        add_to_price(price, quantity)

else
          price = 1.5
          add_to_list(product, price)
          quantity = get_quantity(price)
          add_to_price(price, quantity)
end

puts "Your complete shopping list is: #{@complete_list}
Your total cost is #{@total_price} euro"
