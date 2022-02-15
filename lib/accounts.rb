require 'pg'

class Accounts
  def self.create(first_name:, second_name:, username:, password:, email:, country:, number:)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO accounts (first_name, second_name, username, password, email, country, number) VALUES('#{first_name}', '#{second_name}', '#{username}', '#{password}', '#{email}', '#{country}', '#{number}')") 
  end
end