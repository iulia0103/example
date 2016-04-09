@categories = [:skirts, :dresses, :trousers, :shirts]

@products = {
  :skirts => [{:name => "short skirt", :code => 11, :price => 15.0 },
              {:name => "midi skirt", :code => 12, :price => 20.5 }
  ],
  :dresses => [{:name => "evening dress", :code => 21, :price => 50.0 },
               {:name => "business dress", :code => 22, :price => 35.5 }
  ],
  :trousers => [{:name => "long trousers", :code => 31, :price => 30.0 },
                {:name => "short trousers", :code => 32, :price => 20.0 }
  ],
  :shirts => [{:name => "long sleeve", :code => 41, :price => 17.0 },
              {:name => "short sleeve", :code => 42, :price => 15.5 },
  ]
}

@shopping_list = []
@total_price = 0.0

def show_category
  @categories.each do |category|
    puts "*#{category}"
  end
end

def show_product_in_category
  puts "Type the desired category"
  category = gets.chomp.to_sym

  @products[category].each do |product|
    puts "Name: #{product[:name]}"
    puts "Code: #{product[:code]}"
    puts "Price: #{product[:price]} EUR"
  end
end

#show_product_in_category

def select_product_by_categ_code
  puts "Type the desired category"
  category = gets.chomp.to_sym

  puts "Type the code of the product"
  code = gets.chomp.to_i

  @products[category].each do |product|
      if product[:code] == code
        return product
      end
  end
end

#select_product_by_categ_code

def add_to_shoppinglist_totalprice
  desired_prod = select_product_by_categ_code
  desired_prod[:quantity] = 0

  price = desired_prod[:price]

  puts "Type the desired quantity"
  quantity = gets.chomp.to_i

  final_price = price*quantity
  @total_price += final_price

  desired_prod[:quantity] += quantity
  @shopping_list << desired_prod
end

def increase_quantity
  desired_prod = select_product_by_categ_code

  price = desired_prod[:price]

  puts "Type the desired quantity"
  quantity = gets.chomp.to_i

  final_price = price*quantity
  @total_price += final_price

  desired_prod[:quantity] += quantity
  @shopping_list << desired_prod
end

def continue_adding
  shopping = true
  while shopping
    puts "Would you like to add more products to the shopping list?[y/n]"
    answer = gets.chomp
    if answer == "y"
      if @shopping_list[:code] = desired_prod[:code]
        increase_quantity
      else
        add_to_shoppinglist_totalprice
    else
      shopping = false
    end
  end
end

def view_order
    puts "COMPLETE ORDER"
  puts "-" * 35
  @shopping_list.each do |product|
    puts product
  end
  puts "-" * 35
  puts " TOTAL AMOUNT TO PAY: #{@total_price}"
end

add_to_shoppinglist_totalprice
continue_adding
view_order

def remove_from_shoppinglist_totalprice
  puts "What products would you like to remove from the shopping list?"
  puts "Type the code of the product"
  code = gets.chomp.to_i
  puts "Type the quantity that you want to remove"
  quantity = gets.chomp.to_i

  @shopping_list.each do |product|
    if product[:code] == code
      if product[:quantity] == quantity
        @shopping_list.delete(product)
        price = product[:price]
        @total_price -= price*quantity
      else
        product[:quantity] -= quantity
        price = product[:price]
        @total_price -= price*quantity
      end
    else
      puts "Sorry, the code doesn`t exit in the shopping list!"
    end
  end
end

#add_to_shoppinglist_totalprice
#remove_from_shoppinglist_totalprice
#view_order

def continue_removing
end

def menu
  puts "Welcome to our store!
  What would you like to do?

    1. See available categories
    2. See the products from one category
    3. Add a product to the shopping list
    4. Remove  product from the shopping list
    5. View your shopping list
    6. Exit"
end

def shopping_process
  shopping = true
  while shopping
    menu

    puts "Please enter a choice.[Type the number of the correspondent choice]"
    choice = gets.chomp.to_i

    case choice
      when 1
        show_category
      when 2
        show_product_in_category
      when 3
        add_to_shoppinglist_totalprice
        continue_adding
      when 4
        remove_from_shoppinglist_totalprice
        continue_removing
      when 5
        view_order
      else
        puts "Thank you for visiting our store!"
        shopping = false
    end
  end
end
