$steps_order = []

step1 = {"name"=>"wash", "details"=>"wash the ingredient"}
step2 = {"name"=>"chop", "details"=>"finely chop the ingredient"}
step3 = {"name"=>"cook", "details"=>"cook the ingredient in a pan along with the other ingredients"}
step4 = {"name"=>"pot", "details"=>"add the ingredient in a pot along with the other ingredients and add water until it covers all the ingredients"}
step5 = {"name"=>"boil", "details"=>"boil the ingredients from the pot for 40 minutes"}
step6 = {"name"=>"stir", "details"=>"after boiling for minutes, stir everything and add the spices. Then boil for another 5 minutes"}

$steps_order << step1
$steps_order << step2
$steps_order << step3
$steps_order << step4
$steps_order << step5
$steps_order << step6

$ingredients = []

ingredient1 = { "name"=>"onions", "quantity"=>2, "steps"=>"wash, chop, cook, add, boil, stir" }
ingredient2 = { "name"=>"paprikas", "quantity"=>2, "steps"=>"wash, chop, cook, add, boil, stir"  }
ingredient3 = { "name"=>"tomato", "quantity"=>4, "steps"=>"wash, chop, cook, add, boil, stir"  }
ingredient3 = { "name"=>"ribs", "quantity"=>4, "steps"=>"wash, boil, stir" }
ingredient4 = { "name"=>"bean_pots", "quantity"=>2, "steps"=>"wash, boil, stir"  }
ingredient5 = { "name"=>"spices", "quantity"=>2,  "steps"=>"stir"}

$ingredients << ingredient1
$ingredients << ingredient2
$ingredients << ingredient3
$ingredients << ingredient4
$ingredients << ingredient5

def show_ingredients
  puts "The ingredients needed for the soup are:"
  $ingredients.each do |ingredient|
    puts "#{ingredient["quantity"]} #{ingredient["name"]}"
  end
end

def show_steps_per_ingredient
  $ingredients.each do |ingredient|
    puts "For #{ingredient["name"]} follow these steps: #{ingredient["steps"]}"
  end
end

def show_steps_order
  puts "The order of the steps is the following"
  $steps_order.each do |step|
    puts "#{step["name"]}"
  end
end

def show_step_details
  puts "The details of each steps are as follows"
  $steps_order.each do |step|
    puts"#{step["name"]}: #{step["details"]}"
  end
end

puts "Welcome on `How To Make a Beans Soup page`. Would you like to see the list of needed ingredients?[y/n]"
choice1 = gets.chomp.downcase
if choice1 == "y"
  show_ingredients
else
  puts "Are you sure you want to move forward?[y/n]"
  choice2 = gets.chomp.downcase
  if choice2 == "n"
    puts "Would you like to see the list of needed ingredients?[y/n]"
    choice3 = gets.chomp.downcase
    if choice3 == "y"
      show_ingredients
    end
  end
end

puts "Would you like to see what steps must be separately followed for each ingredient?[y/n]"
answer = gets.chomp.downcase
if answer == "y"
  show_steps_per_ingredient
end

puts "Would you like to see the detailed steps for cooking the soup?[y/n]"
answer = gets.chomp.downcase
if answer == "y"
  show_step_details
end

review = true
while review
  puts "Would like to review the order of the steps?[y/n]"
  answer = gets.chomp.downcase
  if answer == "y"
    show_steps_order
  else
    review = false
  end
end
