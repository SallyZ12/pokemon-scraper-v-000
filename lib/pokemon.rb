
class Pokemon

  attr_accessor :id, :name, :type, :hp, :db


  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db

  end


#   def initialize(id:, name:, type:, hp: nil, db:)
#   @id, @name, @type, @hp, @db = id, name, type, hp, db
# end


  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end



  def self.find (id_num, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    # binding.pry
    Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], db: db)
  end


  def alter_hp(hp, db)
    db.execute("INSERT INTO pokemon (hp) VALUES (?)", hp)

  end

end
