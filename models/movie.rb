require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @title = options['title']
   @genre = options['genre']
   @budget = options['budget']
end

def save()
  sql = "INSERT INTO movies(
        title,
        genre,
        budget
        )
        VALUES ($1, $2, $3)
        RETURNING id"
        values = [@title, @genre, @budget]
        movie = SqlRunner.run(sql, values).first
        @id = movie['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM movies"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM movies
        WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM movies"
  movies = SqlRunner.run(sql)
  return movies.map {|movie| Movie.new (movie)}
end

def update()
  sql = "UPDATE movies
  SET(
    title, genre, budget
    )
    =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
end

def stars()
  sql = "SELECT stars.*
        FROM stars
        INNER JOIN castings
          ON castings.star_id = stars.id
        WHERE castings.movie_id = $1"
  values = [@id]
  stars = SqlRunner.run(sql, values)
  return stars.map{|star| Star.new(star)}
end

def remaining_budget()
  sql = "SELECT fee
        FROM stars
        INNER JOIN castings
          ON castings.star_id = stars.id
        WHERE castings.movie_id = $1"
  values = [@id]
  stars = SqlRunner.run(sql, values)
  total = 0
  # for star in stars
  #   total += star["fee"].to_i
  # end
  # budget = @budget.to_i
  # remaining = budget - total
  # return remaining

  fee_array = []
  stars.each{|star| fee_array << star["fee"].to_i}
  total = fee_array.reduce{|sum,fee| sum + fee}
  budget = @budget.to_i
  remaining = budget - total
  return remaining

end

end
