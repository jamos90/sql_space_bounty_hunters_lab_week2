require("pg")

class BountyHunters

 def initialize(options)
   @name = options['name']
   @bounty_value = options['bounty_value']
   @danger_level = options['danger_level']
   @last_known_location = options['last_known_location']
   @bounty_value = options['bounty_value']

end
