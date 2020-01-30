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
  
  def new_from_db
  
  def save 
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES(?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed).map each do |row|
      
  end 
end 