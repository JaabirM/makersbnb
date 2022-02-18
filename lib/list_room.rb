require 'pg'

class List_Room
  def self.create_room(name, description, price, street, apt_suite, city, county, postcode)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO room (name, description, price, owned_by, street, apt_suite, city, county, postcode) VALUES('#{name}', '#{description}', '#{price}', '1', '#{street}', '#{apt_suite}', '#{city}', '#{county}', '#{postcode}')") 
  end

  def self.my_rooms(id)
    connection = PG.connect(dbname: 'makersbnb')
    array = connection.exec("SELECT name FROM room WHERE owned_by='#{id}';")
    result = array.map { |data| data['name'] }
    return result.join("<br>")
  end
end
