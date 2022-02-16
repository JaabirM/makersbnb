require 'pg'

class Accounts
  def self.create(first_name:, second_name:, username:, password:, email:, country:, number:)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO accounts (first_name, second_name, username, password, email, country, number) VALUES('#{first_name}', '#{second_name}', '#{username}', '#{password}', '#{email}', '#{country}', '#{number}')") 
  end

  def self.details_match?(username, password)
    connection = PG.connect(dbname: 'makersbnb')
    array = connection.exec("SELECT * FROM accounts;")
    result = array.map { |data| data['username'] }
    result_password = array.map { |data| data['password']}

    if (result.include? username) == true
      array_password = connection.exec("SELECT password FROM accounts WHERE username= '#{username}'")
      if array_password[0]['password'] == password
        return true
      else
        return false
      end
    else
       return false
    end
  end
end