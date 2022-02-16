require 'pg'

class Rooms 

  def self.availability 

  end

  def self.list_all
    array = db_connection.exec("SELECT * FROM room;")
    result = array.map { 
      |data| "<div id='room_list'> Name: #{data['name']} <br> Description: #{data['description']} <br> Price: #{data['price']} <br> Owner: #{self.owned_by(data['owned_by'])} <br></div>"
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
      conn = PG.connect(dbname: 'makersbnb') #We can write makersbnb_test database for this bit once that database is created.
    else
      conn = PG.connect(dbname: 'makersbnb')
    end
  end
end