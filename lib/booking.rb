

class Booking
  def self.create_booking(username, booked_date_from, booked_date_to)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO room (username, booked_date_from, booked_date_to) VALUES('#{username}', '#{description}', '#{price}', '1', '#{street}', '#{apt_suite}', '#{city}', '#{county}', '#{postcode}')") 
  end