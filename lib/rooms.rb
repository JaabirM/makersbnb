require 'pg'

class Rooms 

  def self.availability 

  end

  def self.list_all
    array = db_connection.exec("SELECT * FROM room;")
    result = array.map { 
      |data| "<div id='room_list'> Name: #{data['name']} <br> Description: #{data['description']} <br> Price: #{data['price']} <br> Owner: #{self.owned_by(data['owned_by'])} <br> <a href='/book_room?room_name=#{data['name']}'>Book this!</a></div>"
    }
    return result.join("<br><br>")
  end

  private 
  
  def self.owned_by(id)
    array = db_connection.exec("SELECT first_name FROM accounts WHERE id = #{id};")
    result = array.map { |data| data['first_name'] }
    return result.join
  end

  def self.db_connection()
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'makersbnb') 
    else
      conn = PG.connect(dbname: 'makersbnb')
    end
  end
end
