class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

#create?
  def update
    movie = Movie.find(params[:id])

    redirect_to "/movies/#{movie.id}"
  end
end
