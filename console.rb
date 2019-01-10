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

movie2 = Movie.new ({
  'title' => 'The Hobbit',
  'genre' => 'fantasy'
  })

movie2.save()


star1 = Star.new({
  'first_name' => 'Ian',
  'last_name' => 'McKellen'
  })

star2 = Star.new({
  'first_name' => 'Michael',
  'last_name' => 'Freeman'
  })

star1.save()
star2.save()

movie1.title = "The Fellowship of the Ring"
star2.first_name = "Martin"



binding.pry
nil
