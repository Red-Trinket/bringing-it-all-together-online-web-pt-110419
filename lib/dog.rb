class Dog 
  
  attr_accessor :name, :breed, :id
  
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed 
    @id = id 
  end 
  
  def self.create_table 
    sql = <<-SQL 
      CREATE TABLE dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT 
      )
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table 
    sql = <<-SQL 
      DROP TABLE dogs
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def new_from_db(row)
    new_dog = self.new 
    new_dog.id = row[0]
    new_dog.name = row[1]
    new_dog.breed = row[2]
    new_dog
  end 
  
  def save 
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES(?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed).map do |row|
      new_from_db(row)
    end.first
  end 
end 