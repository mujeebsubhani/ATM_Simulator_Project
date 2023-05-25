# frozen_string_literal: true

require 'csv'

def read_from_db
  csv_file_path = 'admin_db'
  db_data = []
  if File.exist?(csv_file_path)
    CSV.foreach(csv_file_path) do |row|
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

puts read_from_db


