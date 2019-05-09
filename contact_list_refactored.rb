# CONTACT LIST REFECTORED

# 1. Have each contact be a hash instead of a string.
# 2. Start with just the contacts name as a key value.
# 3. Add a phone number key value pair.


@contacts =  [
  { 
    first_name: "Sam",
    last_name: "Cat",  
    phone: "801-222-4444" 
  },
  { first_name: "Milo", 
    last_name: "Cat",
    phone: "801-666-1212" 
  }, 
  {
    first_name: "John",
    last_name: "Doe", 
    phone: "555-555-5555"
  }
]

# MAIN MENU 
def main_menu 
  puts 
  puts "---Ruby Contact List---"
  puts "1) Create Contact"
  puts "2) View Contact"
  puts "3) Edit Contact"
  puts "4) Delete Contact"
  puts "5) Exit"
  puts 
  input = gets.strip #get user input 

# CASE INPUT
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

# VIEW ALL CONTACTS 
def view_contacts 
  puts "Current Contacts:" 
  # Will select each hash in the array and in each individual hash will print the name and phone, but does not print index
  # @contacts.select.each{|hash| hash.each {|key, value| puts "#{key}: #{value}"}} 
  @contacts.each_with_index do |c, i|
    puts "#{i + 1})\n Name: #{c[:first_name]} #{c[:last_name]} \n Phone: #{c[:phone]}" 
  end
end 

def create_contact
  puts
  puts "Please Enter Your Contact:"
  print "Enter First Name > "
  new_first_name = gets.strip  #get user input for name
  print "Enter Last Name > "
  new_last_name = gets.strip 
  print "Enter Phone Number > "
  new_phone = gets.strip #get user input for phone 
  new_contact = {
    first_name: "#{new_first_name}", 
    last_name: "#{new_last_name}", 
    phone: "#{new_phone}"
  } #Creating a new hash based on user input 
  @contacts.push(new_contact) #push the new hash to contact array 
  main_menu 
end 


def edit_contact
 puts "---PICK A NUMBER TO EDIT CONTACT---"
 view_contacts
 puts 
 print "> " 
 choice_index = gets.to_i #gets user index choice 
 if choice_index > 0 && choice_index <= @contacts.length 
  puts "Do you want to change the name or phone number?" 
  puts "1) Change Name"
  puts "2) Change Phone Number"
  puts "3) Main Menu"
  print "> "
  choice = gets.strip #get user choice of which to edit 
  case choice 
  when "1"
    print "New First Name: "
    edit_first_name = gets.strip #gets first name input 
    @contacts[choice_index - 1][:first_name] = edit_first_name 
    print "New Last Name: "
    edit_last_name = gets.strip #gets last name input 
    @contacts[choice_index - 1][:last_name] = edit_last_name
    puts "\n---CONTACT LIST AFTER EDITING---\n"
    view_contacts #views new contact list 
  when "2"
    print "New Phone Number: "
    edit_phone = gets.strip #gets phone number input 
    @contacts[choice_index - 1][:phone] = edit_phone
    puts "\n---CONTACT LIST AFTER EDITING---\n"
    view_contacts #views new contact list 
  when "3"
    main_menu
  else 
    puts "Invalid Entry!"
    edit_contact #returns function  TODO: Return to if statement
  end
else 
  puts "Invalid Choice" #end input
  edit_contact
end  #end if 
end 

def delete_contact 
    # get by index and delete
    puts 
    puts "---SELECT A CONTACT TO DELETE---"
    view_contacts #gives contact list 
    puts
    print "> "
    choice = gets.to_i
    if choice > 0 && choice <= @contacts.length
      @contacts.delete_at(choice - 1) #deletes item from array
      puts
      puts "---LIST AFTER DELETION---"
      view_contacts #view contact list 
      main_menu #goes back to main menu after deletion 
    else 
      puts
      puts "Invalid Choice" 
      delete_contact #calls function again 
    end #end if 
end 
  
main_menu