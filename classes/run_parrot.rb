require "./parrot"

parrot1 = Parrot.new("Sam","green", true)
parrot2 = Parrot.new("Gene", "yellow", false)
parrot3 = Parrot.new("Mimi", "red", false)

p parrot1 #p parrot1 = puts parrot1.inspect

p (parrot1.name)
p (parrot2.color)
p (parrot3.can_talk)
