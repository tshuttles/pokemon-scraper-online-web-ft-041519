class Pokemon
  
  attr_accessor :name, :type 
  attr_reader :id 
  
  def initialize(id=nil, name, type)
    @id = id 
    @name = name 
    @type = type 
  end 
  
  def self.save 
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
 
      DB[:conn].execute(sql, self.name, self.type)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 
  end 
end
