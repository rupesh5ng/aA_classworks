def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie.select(:id, :title, :yr, :score).where(yr: 1980..1989).where(score: 3..5)


end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.

  # yrs_with_above_8 = Movie.where(score: 8..10).pluck(:yr).uniq
  # all_yrs = Movie.pluck(:yr).uniq
  # all_yrs - yrs_with_above_8

  Movie.group(:yr).having("MAX(score) <=8 "").pluck(:yr)


end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor.joins(:movies).where(movies: { title: title }).order("castings.ord")
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie.select(:id, :title, "actors.name").joins(:actors).where("actor_id = director_id").where(castings: {ord: 1})


end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  # Casting.select( ,COUNT(*)").joins(:actor).where.not(ord: 1).group(:actor_id).order("COUNT(*) DESC").limit(2).as_json
  Actor.select(:id, :name, "COUNT(*) as roles").joins(:castings).where.not(castings:{ord: 1}).group(:id).order("COUNT(*) DESC").limit(2)
end


