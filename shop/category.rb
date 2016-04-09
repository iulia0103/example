require "./product"

class Category
  attr_accessor :name
  attr_accessor :products

  def initialize(name, products)
    @name = name
    @products = products
  end
end
