require "./product"
require "./category"

class Inventory
  def initialize
    @categories = []
    candy_prod = [Product.new("cola", 123, 0.5), Product.new("choc", 321, 1.2)]
    @categories << Categpry.new("Candy", candy_prod)
  end

  def get_product product_name
    @categories.each do |category|
      category.products.each do |product|
        if product.name == product_name
          return product
        end
      end
    end
    "ow no its not here"
  end

  def list
    @categories.each do |category|
      puts category.name
      category.products.each do |product|
          puts "-- #{product.name}"
      end
    end
  end
end
