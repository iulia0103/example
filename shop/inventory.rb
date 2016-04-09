require "./product"
require "./category"

class Inventory
  def initialize
    @categories = []
    skirts_prod = [Product.new("short skirt", 1.1, 12),
              Product.new("midi skirt", 1.2, 20)
            ]
    @categories << Category.new("skirts", skirts_prod)

    dresses_prod = [Product.new("evening dress", 2.1, 50),
              Product.new("business dress", 2.2, 32)
            ]
    @categories << Category.new("dresses", dresses_prod)

    trousers_pord = [Product.new("long trousers", 3.1, 30),
                Product.new("short trousers", 3.2, 25)
            ]
    @categories << Category.new("trousers", trousers_pord)

    shirts_pord = [Product.new("long sleeve", 4.1, 21),
                Product.new("short sleeve", 4.2, 17)
            ]
    @categories << Category.new("shirts", shirts_pord)
  end

  def get_product(prod_code)
    @categories.each do |category|
      category.products.each do |product|
        if product.code == prod_code
          return product
        end
      end
    end
    "Sorry, we couldn`t find that product"
  end

def list_category
  @categories.each do |category|
    puts "* #{category.name}"
  end
end

def list_all_products
  @categories.each do |category|
    puts "-" * 35
    puts category.name
    puts "-" * 35
    category.products.each do |product|
        puts "* #{product.name}, Code: #{product.code}, Price: #{product.price} EUR "
    end
  end
end

  def list_products_from_category(categ_name)
    @categories.each do |category|
      if category.name == categ_name
        puts category.name
        puts "-" * 35
        category.products.each do |product|
          puts "* #{product.name}, Code: #{product.code}, Price: #{product.price} EUR "
        end
      end
    end
  end
end
