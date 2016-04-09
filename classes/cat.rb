class  Cat
  attr_accessor :name #generates methods to access name

  def initialize(name, fur)
    @name = name
    @fur = fur
  end

  def sound
    "#{@name} says prrrr"       #the method returns the string -> create a method to expose name
  end

  #def name #ruby protects whats inside class, create meth to access name
    #@name
  #end

end

cat1 = Cat.new("Snoes","red")
cat2 = Cat.new("Gigi","gray")

p cat1
p cat1.sound
p cat1.name
