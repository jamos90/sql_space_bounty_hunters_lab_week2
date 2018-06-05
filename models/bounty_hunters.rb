require("pg")

class BountyHunters

  attr_accessor :name, :bounty_value, :danger_level, :last_known_location, :bounty_value

 def initialize(options)
   @id = options['id'].to_i if options ['id']
   @name = options['name']
   @species = options['species']
   @last_known_location = options['last_known_location']
   @bounty_value = options['bounty_value'].to_i()
 end

 def save()
   db = PG.connect({
     dbname: 'bounty_hunters',
     host: 'localhost',
     })
     sql=  "INSERT INTO bounty_hunters
     (name,
       species,
       last_known_location,
       bounty_value)
       VALUES
       ($1,$2,$3,$4) RETURNING id"
       values = [@name,@species,@last_known_location,@bounty_value]
       db.prepare("save", sql)
       id_hash = db.exec_prepared("save",values).first()
       @id = id_hash['id'].to_i()
       db.close()
  end

  def update()
    db = PG.connect({
      dbname: 'bounty_hunters',
      host: 'localhost'
      })
    sql = "UPDATE bounty_hunters
      SET (name,
           species,
           last_known_location,
           bounty_value)
        =
          ($1, $2, $3, $4)
      WHERE id = $5"
    values = [@name,@species,@last_known_location,@bounty_value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()

  end

  def delete()
   db = PG.connect({
     dbname: 'bounty_hunters',
     host: 'localhost'
     })
     sql = "DELETE FROM bounty_hunters WHERE id =$1"
     values =[@id]
     db.prepare("delete",sql)
     db.exec_prepared("delete", values)
     db.close()
   end

end
