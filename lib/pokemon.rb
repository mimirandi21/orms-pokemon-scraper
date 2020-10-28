class Pokemon
    attr_accessor :name, :type, :id, :db
    

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
            SQL
        db.execute(sql, name, type)
        
    end

    def self.new_from_db(set)
            id = set[0]
            name = set[1]
            type = set[2]
            db = @db
            new_pokemon = Pokemon.new(id: id, name: name, type:type, db: db)
            new_pokemon
    end

    def self.find(num, db)
        
        info = db.execute("SELECT * FROM pokemon WHERE id = ?", num)
        self.new_from_db(info[0])


    end


end
