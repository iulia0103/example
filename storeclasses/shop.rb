require "./inventory"

class Shop
  def initialize
    @inventory = Inventory.new
  end

  def what_is_in_store
    @inventory.list
  end
  
  def shop_for_item
    what_is_in_store

    puts "Select item to buy by product name"
    name = gets.chomp

    result = @inventory.get_product name
    p result
  end
end
