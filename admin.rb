# frozen_string_literal: true

require 'csv'
require_relative 'helper'

class Admin

  def initialize
    @csv_file_path = 'admin_db'
  end

  def read_from_db

    db_data = []
    if File.exist?(@csv_file_path)
      CSV.foreach(@csv_file_path) do |row|
        # Access data from each row
        admin_name = row[0]
        admin_id = row[1]
        admin_pin = row[2]

        db_data.push({'admin_name' => admin_name, 'admin_id' => admin_id, 'admin_pin' => admin_pin})
      end
      return db_data
    else
      return NIL
    end
  end

  def display_from_db
    for data in read_from_db
      print("Admin name : ", data['admin_name'], "\n")
      print("Admin id : ", data['admin_id'], "\n")
      print("Admin pin : ", data['admin_pin'], "\n -------------- \n")
    end
  end

  def write_on_db(name, id, pin)

    file_exists = File.exist?(@csv_file_path)

    CSV.open(@csv_file_path, 'a') do |csv|
      csv << [name, id, pin]
    end
  end

  def add_new_admin

    print("Please enter admin name : ", )
    admin_name = gets.chomp().to_s
    print("Please enter admin id : ", )
    admin_id = gets.chomp().to_s
    print("PLease enter admin pin : ")
    admin_pin = gets.chomp().to_i

    write_on_db(admin_name, admin_id, admin_pin)

    return "New Admin Added"

  end

  private :write_on_db, :read_from_db

end


def initiate_admin_panel(admin_pin)

  if db_verification('admin_db', admin_pin) == true
    return get_data_by_pin('admin_db', admin_pin)
  else
    return nil
  end
end
