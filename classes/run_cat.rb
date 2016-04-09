require "./cat"  # "./cat.rb"  require method accepts only ruby files, can be with or without .rb
                # car.rb and run_cat.rb must be in teh same file
cat1 = Cat.new("Snoes","red")
cat2 = Cat.new("Gigi","gray")

p cat1 #shows the id and the object   #p cat1 = puts cat1.inspect
p cat1.sound
p cat1.name
