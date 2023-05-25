require 'csv'

def db_verification(filepath, pin)
  if File.exist?(filepath)
    CSV.foreach(filepath) do |row|

      db_pin = row[2]
      if db_pin.to_i == pin
        return true
      end
    end
  end
  return false
end

def get_data_by_pin(filepath, pin)

  result = Hash
  if File.exist?(filepath)
    CSV.foreach(filepath) do |row|
      # Access data from each row

      db_pin = row[2]
      if db_pin.to_i == pin
        db_name = row[0]
        db_id = row[1]
        result = {'name' => db_name, 'id' => db_id, 'pin' => db_pin}
      end
    end
    return result['name'], result['id'], result['pin']
  else
    return NIL
  end
end


