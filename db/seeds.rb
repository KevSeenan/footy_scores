require('pry-byebug')
require_relative('../models/league.rb')
# require_relative('../models/team.rb')


League.delete_all()

league1 = League.new(
  {
    'name' => 'Clarence Duckworth Invitational'
  }
)

league1.save()

# league1.delete()

league1.name = "CRUD Prem League"
league1.update()

binding.pry

nil
