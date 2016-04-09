class Parrot
  attr_accessor :name
  attr_accessor :color
  attr_accessor :can_talk

  def initialize(name, color, can_talk)
    @name = name
    @color = color
    @can_talk  = can_talk
  end
end

parrot1 = Parrot.new("Sam", "green", true)
parrot2 = Parrot.new("Gene", "yellow", false)
parrot3 = Parrot.new("Mimi", "red", false)

p parrot1.name
p parrot2.color
p parrot3.can_talk
