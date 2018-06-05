require("pry")
require_relative("models/bounty_hunters.rb")

bounty1 = BountyHunters.new({
  'name' => 'Steve',
  'species' => 'Tourian',
  'last_known_location' => 'Earth',
  'bounty_value' => 500
   })

   bounty1.save()

bounty2 = BountyHunters.new({
  'name' => 'Boba-Fet',
  'species' => 'Madalorian',
  'last_known_location' => 'Snarlack_pit',
  'bounty_value' => 500
  })

  bounty2.save()

binding.pry
nil
