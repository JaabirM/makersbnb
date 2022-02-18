class Account_Info
  def self.get_account_info(id)
    array = db_connection.exec("SELECT * FROM accounts WHERE id = #{id};")

    account_info = {
      'first_name' => array[0]['first_name'],
      'second_name' => array[0]['second_name'],
      'username' => array[0]['username'],
      'email' => array[0]['email']
    } #This is hash function, so when you call get_account_info, it returns an hash so you can pick which info you want to get (i.e. username or first name) from the hash

    return account_info
    # puts array[0]['first_name']
    # puts array[0]['second_name']
    # puts array[0]['username']
  end


  private

  def self.db_connection()
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'makersbnb') #We can write makersbnb_test database for this bit once that database is created.
    else
      conn = PG.connect(dbname: 'makersbnb')
    end
  end
end
