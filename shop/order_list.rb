require "./inventory"

class OrderList
  def initialize
    @list = []
  end

  def get_product_from_list(code_inlist)
    @list.each do |product|
      if product.code == code_inlist
        return product
      end
    end
  end

  def add_to_list(product)
    @list << product
  end

  def show_list
    @list.each do |product|
      p product
    end
  end

  def total_to_pay
    total = 0

    @list.each do |product|
      total += product.price
    end
    p "Total: #{total} EUR"
    return total
  end

  def remove_from_list(product)
    @list.delete(product)
    sum = total_to_pay
    sum -= product.price
  end

end
