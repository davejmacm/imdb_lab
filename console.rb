require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

require('pry-byebug')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new ({
  'title' => 'Lord of the Rings',
  'genre' => 'fantasy',
  'budget' => '10000000'
  })

movie1.save()

movie2 = Movie.new ({
  'title' => 'The Hobbit',
  'genre' => 'fantasy',
  'budget' => '25000000'
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

casting1 = Casting.new({
  'movie_id' => movie1.id,
  'star_id' => star1.id,
  'fee' => '1000000'
  })
casting1.save()

casting2 = Casting.new({
  'movie_id' => movie2.id,
  'star_id' => star2.id,
  'fee' => '1250000'
  })

casting2.save()

casting3 = Casting.new({
  'movie_id' => movie2.id,
  'star_id' => star1.id,
  'fee' => '5000000'
  })

casting3.save()

binding.pry
nil
