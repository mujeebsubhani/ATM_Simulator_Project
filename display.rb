
require_relative 'admin'
require_relative 'helper'

def admin_display(name)

  print("Hello ", name, ".\n")
  print("You can do the following : \n" )
  print("1. Add new Admin to the Database \n")
  print("2. View all admin details \n")


  print("Please enter your choice : ")
  choice = gets.chomp().to_i
  a_obj = Admin.new()

  if choice == 1
    a_obj.add_new_admin()
  elsif choice == 2
    a_obj.display_from_db()
  end
  end

def main_display
  print("\t\t------------------- ATM Simulator System ------------------ \n\n")
  print("\t\t 1. Login as Banker \n")
  print("\t\t 2. Login as Customer \n")

  print("Please enter your choice : ")
  choice = gets.chomp().to_i

  if choice == 1
    print("Please enter your admin pin : ")
    admin_pin = gets.chomp().to_i
    if initiate_admin_panel(admin_pin) != nil
      name, id, pin = initiate_admin_panel(admin_pin)
      admin_display(name)
    end
  end
end






