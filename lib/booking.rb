class Booking
  def self.create_booking(username, booked_date_from, booked_date_to)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO bookings (username, booked_date_from, booked_date_to) VALUES('#{username}', '#{booked_date_from}', '#{booked_date_to}');") 
  end
end