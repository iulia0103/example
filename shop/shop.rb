require "./inventory"
require "./order_list"

class Shop
  def initialize
    @inventory = Inventory.new
    @order_list = OrderList.new
  end

  def menu
    puts "Welcome to our store!

    1. List all categories
    2. List a product from a category
    3. List all products
    4. Add a product to the cart
    5. Remove a product from the cart
    6. Show cart
    7. Leave store"
  end

  def show_all_products
     @inventory.list_all_products
  end


  def look_for_product
    show_all_products

    puts "Select desired item by product code"
    prod_code = gets.chomp.to_f

    result = @inventory.get_product prod_code
    p result
  end

  def show_all_categories
    @inventory.list_category
  end

def look_for_product_in_list
  show_list_of_products

  puts "Select the desired item code"
  code_inlist = gets.chomp.to_f

  x = @order_list.get_product_from_list code_inlist
  p x
end

  def add_products_to_list
    result = look_for_product
    @order_list.add_to_list result
    shopping = true
    while shopping
      puts "would you like to continue shopping?[y/n]"
      answer = gets.chomp
      if answer == "y"
        result = look_for_product
        @order_list.add_to_list result
      else
        shopping = false
      end
    end
    p @order_list
  end

  def remove_products_from_list
    y = look_for_product_in_list
    @order_list.remove_from_list y
    removing = true
    while removing
      puts "would you like to continue removing?[y/n]"
      answer = gets.chomp
      if answer == "y"
        y = look_for_product_in_list
        @order_list.remove_from_list y
      else
        removing = false
      end
    end
    p @order_list
  end

def show_list_of_products
  @order_list.show_list
end

def show_total
  @order_list.total_to_pay
end

def leave_shop
  puts "Thank you for visiting us!"
end

def shopping_process
  shopping = true
  while shopping
    menu

    puts "Please type a number from 1 to 7"
    answer = gets.chomp.to_i

    case answer
      when 1
        puts "-" * 35
        show_all_categories
        puts "-" * 35
      when 2
        look_for_product
      when 3
        show_all_products
      when 4
        add_products_to_list
      when 5
        remove_products_from_list
      when 6
        puts "-" * 35
        show_list_of_products
        show_total
        puts "-" * 35
      else
        leave_shop
        shopping = false
    end
  end
end

end
