@contacts = []

@contacts << {first_name: "Iulia", last_name: "Leancu", phone: "0031682429425", email: "iulia.leancu@gmail.com"}
@contacts << {first_name: "Vlad", last_name: "Mihai", phone: "0031626637614", email: "vlad.mihai@gmail.com"}
@contacts << {first_name: "Raluca", last_name: "Dima", phone: "0031623357523", email: "raluca.dima@gmail.com"}

#Display a list of contacts
def display_list_of_contacts
  @contacts.each_with_index do |contact, i|
    puts "#{i+1}. #{contact[:first_name]} #{contact[:last_name]}"
  end
end

#display_list_of_contacts

#Show selected contact
def show_selected_contact
  puts "Who would you like to see?"
  answer = gets.chomp

  i = answer.to_i

  contact = @contacts[i-1]

  puts "#{contact[:first_name]}"
  puts "#{contact[:last_name]}"
  puts "#{contact[:phone]}"
  puts "#{contact[:email]}"
end

#show_selected_contact

#FACTOR METHODS
def index
  @contacts.each_with_index do |contact, i|
    puts "#{i+1}. #{contact[:first_name]} #{contact[:last_name]}"
  end
end

def show( contact )
   puts "#{contact[:first_name]}"
   puts "#{contact[:last_name]}"
   puts "phone: #{contact[:phone]}"
   puts "email: #{contact[:email]}"
end

def show2_selected_contact
  index

  puts
  print "Who would you like to see? "
  answer = gets.chomp

  i = answer.to_i

  contact = @contacts[i-1]

  puts
  show( contact )
end

#show2_selected_contact

#METHOD TO PROMPT THE USER
def ask( prompt )
   print prompt
   gets.chomp
end

def show3_selected_contact
  index

  puts
  answer = ask "Who would you like to see? "

  i = answer.to_i

  contact = @contacts[i-1]

  puts
  show( contact )
end

#show3_selected_contact

#continue asking
def continue_asking_loop
  loop do
    index

    puts
    answer = ask "Who would you like to see? [q to quit]"

    i = answer.to_i

    contact = @contacts[i-1]

    puts
    show( contact )
    break if answer == "q"
  end
  puts "Bye-bye!"
end

#continue_asking_loop

#NEW contact
def new_contact
  loop do
   index

   puts
   answer = ask "Who would you like to see (n for new, q to quit)? "

   break if answer == "q"

   if answer == "n"
      contact = {}

      puts
      puts "Enter contact info:"

      contact[:first_name] = ask "First name? "
      contact[:last_name] = ask "Last name? "
      contact[:phone] = ask "Phone? "
      contact[:email] = ask "Email? "

      @contacts << contact

      puts
      puts "New contact created:"
      puts

      show( contact )
      puts
   else
      i = answer.to_i

      contact = @contacts[i-1]

      puts
      show( contact )
      puts
   end

end
  puts "Bye-bye!"
end

#new_contact

#FACTOR NEW CONTACT
def create_new
   contact = {}

   puts
   puts "Enter contact info:"

   contact[:first_name ] = ask "First name? "
   contact[:last_name ] = ask "Last name? "
   contact[:phone] = ask "Phone? "
   contact[:email] = ask "Email? "

   contact
end

def new_contact2
  loop do
   index

   puts
   answer = ask "Who would you like to see (n for new, q to quit)? "

   break if answer == "q"

   if answer == "n"
      contact = create_new

      @contacts << contact

      puts
      puts "New contact created:"
      puts

      show( contact )
      puts
   else
      i = answer.to_i

      contact = @contacts[i-1]

      puts
      show( contact )
      puts
   end

end
  puts "Bye-bye!"
end

#new_contact2

#ACTIONS
def action_new
  contact = create_new

  @contacts << contact

  puts
  puts "New contact created:"
  puts

  show( contact )
  puts
end

def action_show(i)
   contact = @contacts[i-1]

   puts
   show( contact )
   puts
end

def new_contact3
  loop do
   index

   puts
   answer = ask "Who would you like to see (n for new, q to quit)? "

   break if answer == "q"

   if answer == "n"
      action_new
   else
      action_show(answer.to_i)
   end

end
  puts "Bye-bye!"
end

new_contact3

#DELETE A CONTACT
def action_delete
  puts
  answer = ask "Which contact do you want to delete?"
  i = answer.to_i

  puts "Contact for #{@contacts[i-1][:first_name]} #{@contacts[i-1][:last_name]} deleted."
  @contacts.delete(i-1)
end

def delete_contact
  loop do
   index

   puts
   answer = ask "Who would you like to see (n for new, d for delete, q to quit)? "

   break if answer == "q"

   if answer == "n"
      action_new
   elsif answer == "d"
      action_delete
   else
      action_show(answer.to_i)
   end
end
end

#delete_contact

#UNKNOWN COMMANDS
def action_error
   puts
   puts "Sorry, I don't recognize that command."
   puts
end

def new_contact4
  loop do
   index

   puts
   answer = ask "Who would you like to see (n for new, d for delete, q to quit)? "

   break if answer == "q"

   if answer == "n"
     action_new
   elsif answer == "d"
     action_delete
   elsif answer =~ /[0-9]+/
   action_show(answer.to_i)
else
   action_error
end

end
  puts "Bye-bye!"
end

#new_contact4

#SEARCH CONTACT
def action_search
   puts
   pattern = ask "Search for? "
   puts

   @contacts.each do |contact|
      if contact[:first_name] =~ /\b#{pattern}/i
         show( contact )
         puts
      end
   end
end


#PARSE CONTACTS
