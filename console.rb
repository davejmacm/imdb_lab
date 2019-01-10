require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

require('pry-byebug')

Movie.delete_all()
Star.delete_all()

movie1 = Movie.new ({
  'title' => 'Lord of the Rings',
  'genre' => 'fantasy'
  })

movie1.save()

star1 = Star.new({
  'first_name' => 'Ian',
  'last_name' => 'McKellen'
  })

star1.save()

binding.pry
nil
