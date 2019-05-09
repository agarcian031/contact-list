# Create a menu for user select 
###1 - create contact 
###2 - view contact 
###3 - exit 

#Menu should loop until the user chooses to exit 
#BONUS - delete a contact and edit a contact

# Contacts Array - make it into an instance variable which means that the scope is throughout the script

#create an empty array for user inputs 
#create an array for available contacts
# @user_contacts = [] 
@contacts = ["Bob", "John", "Bill", "Jean"]
# MENU
def main_menu 
  puts 
  puts "---Ruby Contact List ---"
  puts "1) Create Contact"
  puts "2) View Contact"
  puts "3) Edit Contact"
  puts "4) Delete Contact"
  puts "5) Exit"
  puts 
  input = gets.strip #get user input 

  case input 
  when "1"
    create_contact 
  when "2"
    view_contacts
    main_menu
  when "3"
    edit_contact 
    main_menu
  when "4"
    delete_contact
  when "5"
    puts "Goodbye!"
    exit 
  else 
    #exit program or error 
    puts "Invalid Input. Try Again:"
    main_menu
  end 
end 



def view_contacts 
  puts "Current Contacts:"
  @contacts.each_with_index do |c, i|
    puts "#{i + 1}) #{c}"
  end
  # show all of the contacts
  #puts view_contacts
end 

def create_contact
  puts
  puts "Please Enter Your Contact:"
  choice = gets.strip 
  @contacts << choice 
  #gets user input for contact
  main_menu
end 

# TODO: can view the choice, but it only shows the number and not the name of the indexed item
def edit_contact
  puts
  puts "Pick a number to edit contact:"
  view_contacts
  puts 
  print "> "
  choice = gets.to_i
  puts "You chose #{@contacts.fetch(choice - 1)}"
  print "Make changes > "
  choice_add = gets.strip
  if choice > 0 && choice <= @contacts.length 
    @contacts[choice - 1] = choice_add #choice will grab the index of user input and choice_add will replace the index with whatever the user inputs
    puts 
    view_contacts
  else
    puts "Invalid Choice"
    puts
    edit_contact
  end # end if 
end 

def delete_contact 
  # get by index and delete
  puts 
  puts "Select a Contact to Delete"
  view_contacts
  puts
  print "> "
  choice = gets.to_i
  if choice > 0 && choice <= @contacts.length
    @contacts.delete_at(choice - 1) #deletes item from array
    puts
    puts "List After Deletion:"
    view_contacts
    main_menu
  else 
    puts
    puts "Invalid Choice" 
    delete_contact
  end #end if 
end 
  

main_menu