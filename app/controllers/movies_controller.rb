class MoviesController < ApplicationController
  def list
    @movies = fetch_movies
    if params[:qs].present?
      @movies = @movies.select{|c| c.name.downcase.include? params[:qs].downcase}
    end
    if params[:num].present?
      @movies = @movies.select{|f| f.stars.to_s.include? params[:num].to_s}
    end

  end

  def view



  end

  def chart
  end

  def fetch_movies
    sql_query = "SELECT * FROM fandango"
    @movies = ActiveRecord::Base.connection.execute(sql_query)

    @movies = @movies.map do |hash|
      movie = Movie.new
      movie.id = hash["id"].to_i
      movie.name = hash["films"].to_s
      movie.stars = hash["stars"].to_f
      movie.rating = hash["rating"].to_f
      movie.votes = hash["votes"].to_i
      movie
    end
    @movies
  end
end
