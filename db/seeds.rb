require('pry-byebug')
require_relative('../models/league.rb')
require_relative('../models/team.rb')




league1 = League.new(
  {
    'name' => 'Clarence Duckworth Invitational'
  }
)

league1.save()

league1.delete()

binding.pry

nil
